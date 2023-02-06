/* Creació de la db optica */
use('OPTICA');

db.proveidors.insertMany([
  { nom: 'Alfa', adreca: 'Carrer 3 num 5 08085 TER SPAIN', telefon: '932093129', fax: '934054844', nif: '47872216W',
    ulleres:[{},{},{}]
  },
  {nom: 'Bravo',adreca: 'Carrer 7 num 1 08090 BAD SPAIN',telefon: '932043129',fax: '935054844',nif: '47872211X',
    ulleres:[{},{}]
  },
  {nom: 'Charly',adreca: 'Carrer 1 num 3 08081 BCN SPAIN',telefon: '932092129',fax: '932054844',nif: '47872216Q',
    ulleres:[{},{}]
  },
  {nom: 'Delta',adreca: 'Carrer 2 num 4 08082 SAB SPAIN',telefon: '932092120',fax: '932054845',nif: '47872216Y',
    ulleres:[{},{}]
  },
  {nom: 'Echo',adreca: 'Carrer 9 num 10 08070 GIR SPAIN',telefon: '952052120',fax: '952054845',nif: '47872216E',
    ulleres:[{},{}]
  },
]);

db.clients.insertMany([
    {
        nom:"Mercuri", adreça:"Tallers 10, num 5 08012 BCN SPAIN", telefon:"913185677", email:"mercuri@mercuri.com", nif:"47872216M", client_recomanador:null
    },
    {
        nom:"Venus", adreça:"Tigre 8, num 9 08019 BCN SPAIN", telefon:"913155577", email:"venus@venus.com", nif:"47872216V", client_recomanador:"Mercuri"
    },
    {
        nom:"Mart", adreça:"Joaquim Costa 20, num 7 08013 BCN SPAIN", telefon:"913185977", email:"mart@mart.com", nif:"47872216x", client_recomanador:null
    },
    {
        nom:"Saturn", adreça:"Elisabeths 30, num 2 08014 BCN SPAIN", telefon:"913185570", email:"saturn@saturn.com", nif:"47872216S", client_recomanador:"Mart"
    },
]);

db.vendes.insertMany([
    {empleat_venedor:"", data_venda:"", id_ullera_venuda:"", id_client:""},
    {empleat_venedor:"", data_venda:"", id_ullera_venuda:"", id_client:""},
    {empleat_venedor:"", data_venda:"", id_ullera_venuda:"", id_client:""},
    {empleat_venedor:"", data_venda:"", id_ullera_venuda:"", id_client:""},
    {empleat_venedor:"", data_venda:"", id_ullera_venuda:"", id_client:""},
    {empleat_venedor:"", data_venda:"", id_ullera_venuda:"", id_client:""}
]);

db.ulleres.insertMany([
    {id_prov:ObjectId(""), marca:"TomFord", graduacio_esq:2.5, graduacio_dret:3.5, tipus_muntura:"metàl·lica", color_muntura:"blau", color_vidre_esq:"blanc", color_vidre_dret:"verd fosc", preu:180.99},
    {id_prov:ObjectId(""), marca:"TomFord", graduacio_esq:2.5, graduacio_dret:3.5, tipus_muntura:"pasta", color_muntura:"groc", color_vidre_esq:"blanc", color_vidre_dret:"gris clar", preu:90.99},
    {id_prov:ObjectId(""), marca:"TomFord", graduacio_esq:2.5, graduacio_dret:3.5, tipus_muntura:"flotant", color_muntura:"lila", color_vidre_esq:"blanc", color_vidre_dret:"verd fosc", preu:70.99},
    {id_prov:ObjectId(""), marca:"PRADA", graduacio_esq:-2, graduacio_dret:-2, tipus_muntura:"metàl·lica", color_muntura:"vermell", color_vidre_esq:"daurat", color_vidre_dret:"verd clar", preu:150.99},
    {id_prov:ObjectId(""), marca:"PRADA", graduacio_esq:-2, graduacio_dret:-2, tipus_muntura:"pasta", color_muntura:"negre", color_vidre_esq:"daurat", color_vidre_dret:"groc clar", preu:125.99},
    {id_prov:ObjectId(""), marca:"Vogue", graduacio_esq:-4, graduacio_dret:-3.25, tipus_muntura:"pasta", color_muntura:"blau", color_vidre_esq:"platejat", color_vidre_dret:"blau clar", preu:200.99},
    {id_prov:ObjectId(""), marca:"Vogue", graduacio_esq:-4, graduacio_dret:-3.75, tipus_muntura:"flotant", color_muntura:"coral", color_vidre_esq:"platejat", color_vidre_dret:"verd fosc", preu:190.99},
    {id_prov:ObjectId(""), marca:"Emporio", graduacio_esq:-3.5, graduacio_dret:-3.5, tipus_muntura:"metàl·lica", color_muntura:"sepia", color_vidre_esq:"negre", color_vidre_dret:"blau fosc", preu:50.99},
    {id_prov:ObjectId(""), marca:"Emporio", graduacio_esq:-3.5, graduacio_dret:-3.5, tipus_muntura:"flotant", color_muntura:"taronja", color_vidre_esq:"negre", color_vidre_dret:"verd fosc", preu:60.99},
    {id_prov:ObjectId(""), marca:"Reebok", graduacio_esq:-8.5, graduacio_dret:-2.5, tipus_muntura:"pasta", color_muntura:"negre", color_vidre_esq:"negre", color_vidre_dret:"blau fosc", preu:60.99},
    {id_prov:ObjectId(""), marca:"Reebock", graduacio_esq:-1.5, graduacio_dret:-0.5, tipus_muntura:"flotant", color_muntura:"blanc", color_vidre_esq:"negre", color_vidre_dret:"gris clar", preu:60.99},
]);
