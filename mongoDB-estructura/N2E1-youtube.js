use('YOUTUBE');

db.videos.insertMany([
  { _id: ObjectId('0000000000000000000000c1'), titol: '', descripcio: '', data_hora:ISODate(), grandaria: '', nom_arxiu: '', durada: '', thumbnail: '', reproduccions: '',
  likes: [{date:ISODate(), _uid:ObjectId('')}],
  dislikes: [{date:ISODate(), _uid:ObjectId('')}],
  estat: ''},
  { _id: ObjectId('0000000000000000000000c2'), titol: '', descripcio: '', data_hora:ISODate(), grandaria: '', nom_arxiu: '', durada: '', thumbnail: '', reproduccions: '',
  likes: [{date:ISODate(), _uid:ObjectId('')}],
  dislikes: [{date:ISODate(), _uid:ObjectId('')}],
  estat: ''},
  { _id: ObjectId('0000000000000000000000c3'), titol: '', descripcio: '', data_hora:ISODate(), grandaria: '', nom_arxiu: '', durada: '', thumbnail: '', reproduccions: '',
  likes: [{date:ISODate(), _uid:ObjectId('')}],
  dislikes: [{date:ISODate(), _uid:ObjectId('')}],
  estat: ''},
]);

db.usuaris.insertMany([
  { _id: ObjectId('0000000000000000000000b1'), email: '', password: '', nom_usuari: '', data_naixement: '', sexe: '', pais: '', codi_postal: '',
    videos_user: [
        {
            _id_video: ObjectId('0000000000000000000000c1'),
            _id_video: ObjectId('0000000000000000000000c2'),
        }
    ],
    playlists: [
      { _id: ObjectId('0000000000000000000000d1'), nom_playlist: '', data_creacio:ISODate(), estat: '',
      videos_playlist: [
            {
                _id_video: ObjectId('0000000000000000000000c3'),
            }
        ],
        followers:[
            {_userId:ObjectId('0000000000000000000000b2')},
        ]
      },
    ],
    canal:{ canal_id:ObjectId('c00000000000000000000001'), nom_canal:"", descripcio:"", data_creacio:ISODate(),
        subscriptors:[
            { subs_id:ObjectId('0000000000000000000000b2')}
        ]}
  },
  { _id: ObjectId('0000000000000000000000b2'), email: '', password: '', nom_usuari: '', data_naixement: '', sexe: '', pais: '', codi_postal: '',
    videos_user: [
        {
            _id_video: ObjectId('0000000000000000000000c4'),
        }
    ],
    playlists: [
      { _id: ObjectId('0000000000000000000000d1'), nom_playlist: '', data_creacio:ISODate(), estat: '',
      videos_playlist: [
            {
                _id_video: ObjectId('0000000000000000000000c2'),
            }
        ],
        followers:[
            {_userId:ObjectId('0000000000000000000000b1')}
        ]
      },
    ],
  },
]);
