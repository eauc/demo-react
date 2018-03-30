FROM eauc/emacs-org as emacs
WORKDIR /app
COPY ./org ./org
RUN HOME=/home/emacs emacs --batch \
    -l "/home/emacs/elisp/init.el" \
    -l "/home/emacs/elisp/tangle-all.el" \
    --eval "(tangle-all \"org\")"
RUN HOME=/home/emacs emacs --batch \
    -l "/home/emacs/elisp/init.el" \
    -l "/home/emacs/elisp/publish-all.el" \
    --eval "(publish-all \"Demo React\" \"org\" \"docs\")"

FROM node:8 as node
WORKDIR /app
COPY --from=emacs /app/package.json .
COPY yarn.lock .
RUN npm install -g yarn
RUN yarn install
COPY --from=emacs /app/src ./src
COPY --from=emacs /app/public ./public
RUN npm run build

FROM nginx as server
COPY --from=node /app/build /usr/share/nginx/html
COPY --from=emacs /app/docs /usr/share/nginx/html/docs
COPY ./nginx.conf.template /etc/nginx/conf.d/conf.template
ENV PORT 80
CMD /bin/bash -c "envsubst < /etc/nginx/conf.d/conf.template > /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'"
