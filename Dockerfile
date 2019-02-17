FROM mcr.microsoft.com/windows/servercore:1809 AS build
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop';"]

ARG APP_VERSION
ENV APP_VERSION ${APP_VERSION}

RUN iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex;
RUN choco install radarr --ignore-checksums -y --version $env:APP_VERSION;

FROM mcr.microsoft.com/windows/servercore:1809 AS final

COPY --from=build C:\\ProgramData\\Radarr C:\\app

EXPOSE 8989
 
VOLUME [ "C:/config" ]
VOLUME [ "C:/Movies"]
WORKDIR C:\\app\\bin

CMD [ "Radarr.Console.exe", "/data=C:\\config\\" ]
