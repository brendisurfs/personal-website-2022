#!/bin/sh
source .env
npx get-graphql-schema https://graphql.datocms.com/ -j -h "Authorization=Bearer $VITE_API_DATO" | tee graphql_schema.json
