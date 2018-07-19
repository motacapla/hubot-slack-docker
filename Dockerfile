FROM node
MAINTAINER tikeda

ENV TZ JST-9

RUN npm install -g yo generator-hubot
RUN npm list -g yo generator-hubot
RUN useradd bot
RUN mkdir /home/bot && chown bot.bot /home/bot

USER bot
WORKDIR /home/bot
RUN  yo hubot --owner "tikeda" --name "yaju-bot" --description "ikisugiii" --adapter slack

CMD cd /home/bot/hubot
RUN npm install cheerio-httpcli --save
RUN npm install cron --save
RUN npm install hubot-google-images --save
RUN npm install hubot-slack-attachment --save

ADD ./scripts/* ./scripts/
ADD package.json package.json

CMD ["bin/hubot", "--adapter", "slack", "-n", "yaju"]

