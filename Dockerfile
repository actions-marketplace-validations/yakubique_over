FROM opaoz/over as source

FROM alpine
LABEL authors="Vladimir <opa_oz> Levin"
RUN apk update --no-cache && apk add --no-cache ca-certificates

COPY --from=source /app/over /app/over

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
