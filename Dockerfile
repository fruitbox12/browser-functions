FROM zenika/alpine-chrome:with-puppeteer

ENV PUPPETEER_EXECUTABLE_PATH /usr/bin/chromium-browser
ENV IN_DOCKER   1

EXPOSE 3000
EXPOSE 9229

USER root
# copy in our app
RUN mkdir /app
COPY --chown=chrome . /app

USER chrome
ENTRYPOINT ["tini", "--"]

# Run your program under Tini
WORKDIR /app
CMD ["npm", "run", "start"]