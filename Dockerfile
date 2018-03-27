FROM jare/emacs:latest as emacs

RUN git clone --recurse --branch test https://github.com/eauc/dotfiles /home/emacs/dotfiles

WORKDIR /app
COPY ./elisp ./elisp
COPY ./org ./org
COPY ./public ./public
RUN HOME=/home/emacs emacs --batch -f toggle-debug-on-error -l "/app/elisp/tangle-all.el" --eval '(tangle-all "org")'

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
