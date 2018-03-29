FROM jare/emacs:latest as emacs
RUN apt-get update && apt-get install -y wget
RUN mkdir -p /home/emacs && \
cd /home/emacs && \
wget https://orgmode.org/org-9.1.9.tar.gz && \
tar xvzf org-9.1.9.tar.gz
RUN git clone --recurse --branch test https://github.com/eauc/dotfiles /home/emacs/dotfiles
COPY ./elisp /home/emacs/elisp
RUN HOME=/home/emacs emacs --batch -f toggle-debug-on-error \
-l "/home/emacs/elisp/install.el"
WORKDIR /app
COPY ./org ./org
RUN HOME=/home/emacs emacs --batch -f toggle-debug-on-error \
-l "/home/emacs/elisp/init.el" \
-l "/home/emacs/elisp/tangle-all.el"
RUN HOME=/home/emacs emacs --batch -f toggle-debug-on-error \
-l "/home/emacs/elisp/init.el" \
-l "/home/emacs/elisp/publish-html.el"

FROM node:8 as node
WORKDIR /app
COPY --from=emacs /app/src ./src
COPY --from=emacs /app/public ./public
COPY --from=emacs /app/package.json .
COPY yarn.lock .
RUN npm install -g yarn
RUN yarn install
RUN npm run build

FROM nginx as server
COPY --from=node /app/build /usr/share/nginx/html
COPY --from=emacs /app/docs /usr/share/nginx/html/docs
