import swaggerJSDoc from 'swagger-jsdoc';
const options = {
definition: {
openapi: '3.0.0',
info: {
title: 'Study APP',
version: '1.0.0',
description: 'Documentação organizada por ficheiros YAML'
},
},
apis: ['./src/docs/*.yaml'],
};
export const specs = swaggerJSDoc(options);
