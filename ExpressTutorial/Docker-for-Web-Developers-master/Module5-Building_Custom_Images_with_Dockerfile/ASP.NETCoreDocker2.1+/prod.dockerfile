FROM microsoft/dotnet:2.1-aspnetcore-runtime AS base
WORKDIR /app

FROM microsoft/dotnet:2.1-sdk AS build
WORKDIR /src
COPY ["ASP.NETCoreDemos.csproj", "./"]
RUN dotnet restore "./ASP.NETCoreDemos.csproj"
COPY . .
WORKDIR "/src/."
RUN dotnet build "ASP.NETCoreDemos.csproj" -c Release -o /app

FROM build AS publish
RUN dotnet publish "ASP.NETCoreDemos.csproj" -c Release -o /app

FROM base AS final
ENV  ASPNETCORE_URLS=http://*:5000
EXPOSE 5000
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "ASP.NETCoreDemos.dll"]

## Instructions

# 1. Run docker build -t aspnetcoredemos -f prod.dockerfile .
# 2. Run docker run -p 8080:5000 aspnetcoredemos
