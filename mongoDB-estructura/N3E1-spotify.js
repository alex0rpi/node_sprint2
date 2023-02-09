use('SPOTIFY');

db.artists.insertMany([
  { _id:ObjectId('0000000000000000000000b1'), nom: '', imatge: '',
    albums: [
      { _id_album:ObjectId('0000000000000000000000a1'), titol: '', any_pub:2013, imatge: '',
        songs: [
          { _id:ObjectId('000000000000000000000001'), titol: '', durada: '', reprod: 599 },
          { _id:ObjectId('000000000000000000000002'), titol: '', durada: '', reprod: 300 },
        ],
      },
      { _id_album:ObjectId('0000000000000000000000a2'), titol: '', any_pub:2022, imatge: '',
        songs: [
          { _id:ObjectId('000000000000000000000003'), titol: '', durada: '', reprod: 201 },
          { _id:ObjectId('000000000000000000000004'), titol: '', durada: '', reprod: 206 },
        ],
      },
    ],
  },
  { _id:ObjectId('0000000000000000000000b2'), nom: '', imatge: '',
    albums: [
      { titol: '', any_pub:2003, imatge: '',
        songs: [
          { _id:ObjectId('000000000000000000000005'), titol: '', durada: '', reprod: 999 },
          { _id:ObjectId('000000000000000000000006'), titol: '', durada: '', reprod: 1234 },
        ],
      },
    ],
  },
]);

db.usuaris.insertMany([
  { _id:ObjectId('0000000000000000000000d1'), tipus_user: '', email: '', password: '', nom_usuari: '', data_naixement: '', sexe: '', pais: '', codi_postal: '',
    playlists:[
      { owner_id:ObjectId('0000000000000000000000d1'), titol:"", num_songs:2, data_creacio:"", data_eliminacio:"", tipus_playlist:"",
      canciones:[
        {id_song:ObjectId('000000000000000000000001')},
        {id_song:ObjectId('000000000000000000000002')},
      ]}
    ],
    albums_favorits:[
      {_id_album:ObjectId('0000000000000000000000a1')}
    ],
    subscripcio:{ _id:ObjectId('1111111111111111111111a1'), data_inici:ISODate(), data_renovacio:ISODate(),
      forma_pagament:{ tipus:"targeta", numero_tarjeta:"", mes_caducitat:"", any_caducitat:"", codi_seguretat:"" },
      pagaments:[
        {pay_date:ISODate(), total:NumberDecimal('8.99')},
        {pay_date:ISODate(), total:NumberDecimal('8.99')},
        {pay_date:ISODate(), total:NumberDecimal('8.99')}
      ]
    }
  },
  { _id:ObjectId('0000000000000000000000d2'), tipus_user: '', email: '', password: '', nom_usuari: '', data_naixement: '', sexe: '', pais: '', codi_postal: '',
    playlists:[
      { owner_id:ObjectId('0000000000000000000000d2'), titol:"", num_songs:2, data_creacio:"", tipus_playlist:"",
      canciones:[
        {id_song:ObjectId('000000000000000000000006')},
      ]}
    ],
    albums_favorits:[
      {_id_album:ObjectId('0000000000000000000000a2')}
    ],
    subscripcio:{ _id:ObjectId('1111111111111111111111a2'), data_inici:ISODate(), data_renovacio:ISODate(),
      forma_pagament:{ tipus:"paypal", paypal_id:"", paypal_username:"" },
      pagaments:[
        {pay_date:ISODate(), total:NumberDecimal('8.99')},
        {pay_date:ISODate(), total:NumberDecimal('8.99')},
      ]
    }
  },
  { _id:ObjectId('0000000000000000000000d3'), tipus_user: '', email: '', password: '', nom_usuari: '', data_naixement: '', sexe: '', pais: '', codi_postal: '',
    albums_favorits:[
      {_id_album:ObjectId('0000000000000000000000a2')}
    ],
    artistes_seguits:[
      {_id_artista:ObjectId('0000000000000000000000b1')},
      {_id_artista:ObjectId('0000000000000000000000b2')},
    ]
  },
]);
