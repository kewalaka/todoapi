# Use the sample from here:
# https://github.com/dotnet/dotnet-docker/tree/master/samples
FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build
WORKDIR /source

# copy csproj and restore as distinct layers
COPY *.csproj .
RUN dotnet restore

# copy and publish app and libraries.
# A ".dockerignore" file is recommended to stop objects 
# being pulled into the container causing build errors.
# https://github.com/dotnet/dotnet-docker/issues/1649#issuecomment-581433906
COPY . .
RUN dotnet publish -c release -o /app --no-restore

# final stage/image
FROM mcr.microsoft.com/dotnet/core/aspnet:3.1
WORKDIR /app
COPY --from=build /app .
ENTRYPOINT ["dotnet", "TodoApi.dll"]