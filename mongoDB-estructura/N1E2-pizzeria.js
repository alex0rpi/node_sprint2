/* Creació de la db pizzeria */
use('PIZZERIA');

db.botigues.insertMany([
    { _id:ObjectId("000000000000000000000b01"),adreça:"Borrell 11", codi_postal:"08015", localitat:"Barcelona", provincia:"BCN",
    empleats:[
        {_id:ObjectId("000000000000000000000a06"), nom:"Fox", cognoms:"McCloud", nif:"47872216Q", telefon:"666666666", rol:"cuiner"},
        {_id:ObjectId("000000000000000000000a01"), nom:"James", cognoms:"McCloud", nif:"47872216J", telefon:"666666661", rol:"repartidor"},
        ]},
    { _id:ObjectId("000000000000000000000b02"),adreça:"Molist 16", codi_postal:"08008", localitat:"Abrera", provincia:"BCN",
    empleats:[
        {_id:ObjectId("000000000000000000000a05"), nom:"Falco", cognoms:"Lomardi", nif:"47872216S", telefon:"666666665", rol:"cuiner"},
        {_id:ObjectId("000000000000000000000a02"), nom:"Peppy", cognoms:"Hare", nif:"47872216P", telefon:"666666664", rol:"repartidor"},
        ]},
    { _id:ObjectId("000000000000000000000b03"),adreça:"Cuba 20", codi_postal:"08015", localitat:"Vilassar", provincia:"BCN",
    empleats:[
        {_id:ObjectId("000000000000000000000a04"), nom:"Pigma", cognoms:"Dengar", nif:"47872216I", telefon:"666666663", rol:"cuiner"},
        {_id:ObjectId("000000000000000000000a03"), nom:"Rob", cognoms:"rob64", nif:"47872216R", telefon:"666666662", rol:"repartidor"},
        ]},
])

db.productes.insertMany([
    {_id: ObjectId("000000000000000000000d01"), tipus:"beguda", nom:"estrella", descripcio:"regular lager beer", imatge:"C/users/pepito/documents/img/pizzes/estrella.png", preu:NumberDecimal("2.10")},
    {_id: ObjectId("000000000000000000000d02"), tipus:"beguda", nom:"volldum", descripcio:"regular lager beer", imatge:"C/users/pepito/documents/img/pizzes/volldum.png", preu:NumberDecimal("2.10")},
    {_id: ObjectId("000000000000000000000d03"), tipus:"beguda", nom:"cola", descripcio:"regular lager beer", imatge:"C/users/pepito/documents/img/pizzes/cola.png", preu:NumberDecimal("2.50")},
    {_id: ObjectId("000000000000000000000d04"), tipus:"beguda", nom:"water", descripcio:"regular lager beer", imatge:"C/users/pepito/documents/img/pizzes/water.png", preu:NumberDecimal("3")},
    {_id: ObjectId("000000000000000000000d05"), tipus:"hamburguesa", nom:"tofu_burguer", descripcio:"regular lager beer", imatge:"C/users/pepito/documents/img/pizzes/tofu.png", preu:NumberDecimal("10.90")},
    {_id: ObjectId("000000000000000000000d06"), tipus:"hamburguesa", nom:"chicken_burguer", descripcio:"regular lager beer", imatge:"C/users/pepito/documents/img/pizzes/chicken.png", preu:NumberDecimal("10.90")},
    {_id: ObjectId("000000000000000000000d07"), tipus:"hamburguesa", nom:"250g_good_burger", descripcio:"regular lager beer", imatge:"C/users/pepito/documents/img/pizzes/good.png", preu:NumberDecimal("10.90")},
    {_id: ObjectId("000000000000000000000d08"), tipus:"pizza", cat_pizza:["KIDS", "CARNIVORS"], nom:"manchego", descripcio:"all_the_cheese_in_the_world", imatge:"C/users/pepito/documents/img/pizzes/manchego.png", preu:NumberDecimal("8.90")},
    {_id: ObjectId("000000000000000000000d09"), tipus:"pizza", cat_pizza:["KIDS", "CARNIVORS"], nom:"boloñesa", descripcio:"dont_have_macarroni_but_at_least_youll_be_happy", imatge:"C/users/pepito/documents/img/pizzes/boloñesa.png", preu:NumberDecimal("6.90")},
    {_id: ObjectId("000000000000000000000d10"), tipus:"pizza", cat_pizza:["KIDS", "VEGGIE"], nom:"tomatini", descripcio:"tasty_delicious_local_vegetables", imatge:"C/users/pepito/documents/img/pizzes/tomatini.png", preu:NumberDecimal("14.90")},
    {_id: ObjectId("000000000000000000000d11"), tipus:"pizza", cat_pizza:["VEGGIE"], nom:"tofu", descripcio:"not_so_tasty_but_some_people_order_this", imatge:"C/users/pepito/documents/img/pizzes/tofu.png", preu:NumberDecimal("12.90")},
    {_id: ObjectId("000000000000000000000d12"), tipus:"pizza", cat_pizza:["KIDS", "CARNIVORS"], nom:"gorlomi", descripcio:"this_is_the_one", imatge:"C/users/pepito/documents/img/pizzes/gorlomi.png", preu:NumberDecimal("13.90")},
    {_id: ObjectId("000000000000000000000d14"), tipus:"pizza", cat_pizza:["KIDS", "CARNIVORS"], nom:"decoco", descripcio:"for_hipsters_who_have_extra_cash", imatge:"C/users/pepito/documents/img/pizzes/decoco.png", preu:NumberDecimal("16.90")},
]);

db.clients.insertMany([
  { nom:"Mario", cognoms:"Kart", adreça:"Acorn Plains 2", cp:"08019", localitat:"Hospitalet", provincia:"BCN", tel:"999999999",
  comandes:[
    {_id: ObjectId("000000000000000000000c01"), productes:[
        {prod:ObjectId("000000000000000000000d01"), qty:1},
        {prod:ObjectId("000000000000000000000d10"), qty:2},
        ],
        data_hora:ISODate(), tipus:"repartiment", preu_total:NumericDecimal("30.00"), id_botiga:ObjectId('000000000000000000000b01'), repart_id:ObjectId('000000000000000000000a01'), hora_rep:ISODate()},
    {_id: ObjectId("000000000000000000000c02"), productes:[
        {prod:ObjectId("000000000000000000000d03"), qty:2},
        {prod:ObjectId("000000000000000000000d05"), qty:1},
        ],
        data_hora:ISODate(), tipus:"recollida", preu_total:NumericDecimal("30.00"), id_botiga:ObjectId('000000000000000000000b01'), repart_id:ObjectId('000000000000000000000a01'), hora_rep:ISODate()},
    {_id: ObjectId("000000000000000000000c03"), productes:[
        {prod:ObjectId("000000000000000000000d02"), qty:3},
        {prod:ObjectId("000000000000000000000d08"), qty:2},
        ],
        data_hora:ISODate(), tipus:"recollida", preu_total:NumericDecimal("30.00"), id_botiga:ObjectId('000000000000000000000b01'), repart_id:ObjectId('000000000000000000000a01'), hora_rep:ISODate()},
    ]},
  { nom:"Luigi", cognoms:"Land", adreça:"Soda Jungle 3", cp:"08018", localitat:"Hospitalet", provincia:"BCN", tel:"899999999",
  comandes:[
    {_id: ObjectId("000000000000000000000c04"), productes:[
        {prod:ObjectId("000000000000000000000d06"), qty:2},
        {prod:ObjectId("000000000000000000000d07"), qty:1},
        ],
        data_hora:ISODate(), tipus:"domicili", preu_total:NumericDecimal("30.00"), id_botiga:ObjectId('000000000000000000000b02'), repart_id:ObjectId('000000000000000000000a02'), hora_rep:ISODate()},
    ]},
  { nom:"Toad", cognoms:"Bros", adreça:"Lyer Cake Desert", cp:"08017", localitat:"Hospitalet", provincia:"BCN", tel:"799999999",
  comandes:[
    {_id: ObjectId("000000000000000000000c05"), productes:[
        {prod:ObjectId("000000000000000000000d04"), qty:2},
        {prod:ObjectId("000000000000000000000d11"), qty:1},
        ],
        data_hora:ISODate(), tipus:"repartiment", preu_total:NumericDecimal("30.00"), id_botiga:ObjectId('000000000000000000000b02'), repart_id:ObjectId('000000000000000000000a02'), hora_rep:ISODate()},
    {_id: ObjectId("000000000000000000000c06"), productes:[
        {prod:ObjectId("000000000000000000000d05"), qty:2},
        {prod:ObjectId("000000000000000000000d07"), qty:1},
        ],
        data_hora:ISODate(), tipus:"repartiment", preu_total:NumericDecimal("30.00"), id_botiga:ObjectId('000000000000000000000b02'), repart_id:ObjectId('000000000000000000000a02'), hora_rep:ISODate()},
    ]},
  { nom:"Bowser", cognoms:"Galaxy", adreça:"Frosted Glacier 6", cp:"08016", localitat:"Cornella", provincia:"BCN", tel:"699999999",
  comandes:[
    {_id: ObjectId("000000000000000000000c07"), productes:[
        {prod:ObjectId("000000000000000000000d06"), qty:3},
        {prod:ObjectId("000000000000000000000d02"), qty:2},
        ],
        data_hora:ISODate(), tipus:"recollida", preu_total:NumericDecimal("30.00"), id_botiga:ObjectId('000000000000000000000b03'), repart_id:ObjectId('000000000000000000000a03'), hora_rep:ISODate()},
    ]},
  { nom:"Goomba", cognoms:"World", adreça:"Sparkling Waters 8", cp:"08015", localitat:"Palamos", provincia:"BCN", tel:"599999999",
  comandes:[
    {_id: ObjectId("000000000000000000000c09"), productes:[
        {prod:ObjectId("000000000000000000000d11"), qty:2},
        {prod:ObjectId("000000000000000000000d02"), qty:1},
        ],
        data_hora:ISODate(), tipus:"recollida", preu_total:NumericDecimal("30.00"), id_botiga:ObjectId('000000000000000000000b03'), repart_id:ObjectId('000000000000000000000a03'), hora_rep:ISODate()},
    ]},
  { nom:"Turtle", cognoms:"Stars", adreça:"Peach Castle 10", cp:"08014", localitat:"Calonge", provincia:"GIR", tel:"499999999",
  comandes:[
    {_id: ObjectId("000000000000000000000c10"), productes:[
        {prod:ObjectId("000000000000000000000d03"), qty:2},
        {prod:ObjectId("000000000000000000000d12"), qty:1},
        ],
        data_hora:ISODate(), tipus:"repartiment", preu_total:NumericDecimal("30.00"), id_botiga:ObjectId('000000000000000000000b03'), repart_id:ObjectId('000000000000000000000a03'), hora_rep:ISODate()},
    ]},
]);