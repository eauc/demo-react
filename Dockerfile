FROM emacs-org as emacs
WORKDIR /app
COPY ./org ./org
RUN emacs --batch -l "/root/.emacs.d/init.el" \
    --eval "(tangle-all \"org\")" \
    --eval "(publish-all \"Demo React\" \"org\" \"docs\")"
RUN cp /root/theme.css /app/docs/

FROM node:10 as node
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY --from=emacs /app/src ./src
COPY --from=emacs /app/public ./public
COPY --from=emacs /app/.babelrc .
COPY --from=emacs /app/webpack.config.js .
RUN npm run build

FROM nginx as server
COPY --from=node /app/build /usr/share/nginx/html
COPY --from=emacs /app/docs /usr/share/nginx/html/docs
COPY ./nginx.conf.template /etc/nginx/conf.d/conf.template
ENV PORT 80
CMD /bin/bash -c "envsubst < /etc/nginx/conf.d/conf.template > /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'"
