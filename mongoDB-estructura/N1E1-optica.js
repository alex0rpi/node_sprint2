/* Creació de la db optica */
use('OPTICA');

db.proveidors.insertMany([
  {
    nom: 'Alfa',
    adreca: 'Carrer 3 num 5 08085 TER SPAIN',
    telefon: '932093129',
    fax: '934054844',
    nif: '47872216W',
    ulleres: [
      { _id: ObjectId("000000000000000000000001") , marca:"TomFord", graduacio:[2.5,3.5], tipus_muntura:"metàl·lica", color_muntura:"blau", color_vidres:["blanc","verd fosc"], preu:NumberDecimal("180.99")},
      { _id: ObjectId("000000000000000000000002") , marca:"TomFord", graduacio:[2.5,3.5], tipus_muntura:"pasta", color_muntura:"groc", color_vidres:["blanc","gris clar"], preu:NumberDecimal("90.99")},
      { _id: ObjectId("000000000000000000000003") , marca:"TomFord", graduacio:[2.5,3.5], tipus_muntura:"flotant", color_muntura:"lila", color_vidres:["blanc","verd fosc"], preu:NumberDecimal("70.99")},
    ],
  },
  {
    nom: 'Bravo',
    adreca: 'Carrer 7 num 1 08090 BAD SPAIN',
    telefon: '932043129',
    fax: '935054844',
    nif: '47872211X',
    ulleres: [
      { _id: ObjectId("000000000000000000000004") , marca:"PRADA", graduacio:[-2,-2], tipus_muntura:"metàl·lica", color_muntura:"vermell", color_vidres:["daurat","verd clar"], preu:NumberDecimal("150.99")},
      { _id: ObjectId("000000000000000000000005") , marca:"PRADA", graduacio:[-2,-2], tipus_muntura:"pasta", color_muntura:"negre", color_vidres:["daurat","groc clar"], preu:NumberDecimal("125.99")},
    ],
  },
  {
    nom: 'Charly',
    adreca: 'Carrer 1 num 3 08081 BCN SPAIN',
    telefon: '932092129',
    fax: '932054844',
    nif: '47872216Q',
    ulleres: [
      { _id: ObjectId("000000000000000000000006") , marca:"Vogue", graduacio:[-4,-3.25], tipus_muntura:"pasta", color_muntura:"blau", color_vidres:["platejat","blau clar"], preu:NumberDecimal("200.99")},
      { _id: ObjectId("000000000000000000000007") , marca:"Vogue", graduacio:[-4,-3.75], tipus_muntura:"flotant", color_muntura:"coral", color_vidres:["platejat","verd fosc"], preu:NumberDecimal("190.99")},
    ],
  },
  {
    nom: 'Delta',
    adreca: 'Carrer 2 num 4 08082 SAB SPAIN',
    telefon: '932092120',
    fax: '932054845',
    nif: '47872216Y',
    ulleres: [
      { _id: ObjectId("000000000000000000000008") , marca:"Emporio", graduacio:[-3.5,-3.5], tipus_muntura:"metàl·lica", color_muntura:"sepia", color_vidres:["negre","blau fosc"], preu:NumberDecimal("50.99")},
      { _id: ObjectId("000000000000000000000009") , marca:"Emporio", graduacio:[-3.5,-3.5], tipus_muntura:"flotant", color_muntura:"taronja", color_vidres:["negre","verd fosc"], preu:NumberDecimal("60.99")},
    ],
  },
  {
    nom: 'Echo',
    adreca: 'Carrer 9 num 10 08070 GIR SPAIN',
    telefon: '952052120',
    fax: '952054845',
    nif: '47872216E',
    ulleres: [
      { _id:  ObjectId("000000000000000000000010"), marca:"Reebock", graduacio:[-8.5,-2.5], tipus_muntura:"pasta", color_muntura:"negre", color_vidres:["negre","gris clar"], preu:NumberDecimal("60.99")},
      { _id:  ObjectId("000000000000000000000011"), marca:"Reebock", graduacio:[-1.5,-0.5], tipus_muntura:"flotant", color_muntura:"blanc", color_vidres:["negre","gris clar"], preu:NumberDecimal("60.99")},
    ],
  },
]);

db.clients.insertMany([
  {
    nom: 'Mercuri',
    adreça: 'Tallers 10, num 5 08012 BCN SPAIN',
    telefon: '913185677',
    email: 'mercuri@mercuri.com',
    nif: '47872216M',
    client_recomanador: null,
    vendes: [
      { _id: ObjectId("0000000000000000000000a1"),empleat_venedor: 'Mario', data_venda: ISODate(), _id_ullera: ObjectId('000000000000000000000001') },
      { _id: ObjectId("0000000000000000000000a2"),empleat_venedor: 'Luigi', data_venda: ISODate(), _id_ullera: ObjectId('000000000000000000000011') },
    ],
  },
  {
    nom: 'Venus',
    adreça: 'Tigre 8, num 9 08019 BCN SPAIN',
    telefon: '913155577',
    email: 'venus@venus.com',
    nif: '47872216V',
    client_recomanador: 'Mercuri',
    vendes: [
      { _id: ObjectId("0000000000000000000000a3"),empleat_venedor: 'Mario', data_venda: ISODate(), _id_ullera: ObjectId('000000000000000000000002') },
      { _id: ObjectId("0000000000000000000000a4"),empleat_venedor: 'Luigi', data_venda: ISODate(), _id_ullera: ObjectId('000000000000000000000010') },
    ],
  },
  {
    nom: 'Mart',
    adreça: 'Joaquim Costa 20, num 7 08013 BCN SPAIN',
    telefon: '913185977',
    email: 'mart@mart.com',
    nif: '47872216x',
    client_recomanador: null,
    vendes: [
      { _id: ObjectId("0000000000000000000000a5"),empleat_venedor: 'Mario', data_venda: ISODate(), _id_ullera: ObjectId('000000000000000000000003') },
      { _id: ObjectId("0000000000000000000000a6"),empleat_venedor: 'Mario', data_venda: ISODate(), _id_ullera: ObjectId('000000000000000000000009') },
    ],
  },
  {
    nom: 'Saturn',
    adreça: 'Elisabeths 30, num 2 08014 BCN SPAIN',
    telefon: '913185570',
    email: 'saturn@saturn.com',
    nif: '47872216S',
    client_recomanador: 'Mart',
    vendes: [],
  },
])

// Llista el total de compres d’un client/a.
// db.clients.find({ nom: "Mercuri" }, { vendes: 1 })

//* Llista les diferents ulleres que ha venut un empleat durant un any.
// db.clients.find({vendes:{$elemMatch:{empleat_venedor:"Mario"}}}, {vendes:{empleat_venedor:1}, vendes:{_id_ullera:1}})
// db.clients.find({'vendes.empleat_venedor':"Luigi"}, {'vendes._id_ullera':1, 'vendes.empleat_venedor':1})
// db.clients.find({vendes:{$elemMatch:{empleat_venedor:"Luigi"}}}, {'vendes._id_ullera':1, 'vendes.empleat_venedor':1})

//* Llista els diferents proveïdors que han subministrat ulleres venudes amb èxit per l'òptica.
// db.clients.find({},{"proveidors.nom":1})
