use('YOUTUBE');

db.videos.insertMany([
  { _id: ObjectId('0000000000000000000000c1'), titol: '', descripcio: '', data_hora:ISODate(), grandaria: 1000000, nom_arxiu: '', durada: '', thumbnail: 'c/users/formacio/documents/img/video1.png', reproduccions: 4500,
  likes: [{date:ISODate(), _uid:ObjectId('0000000000000000000000b1')}],
  dislikes: [{date:ISODate(), _uid:ObjectId('0000000000000000000000b2')}],
  estat: ''},
  { _id: ObjectId('0000000000000000000000c2'), titol: '', descripcio: '', data_hora:ISODate(), grandaria: 2000000, nom_arxiu: '', durada: '', thumbnail: 'c/users/formacio/documents/img/video2.png', reproduccions: 10000,
  likes: [{date:ISODate(), _uid:ObjectId('0000000000000000000000b2')}],
  dislikes: [],
  estat: ''},
  { _id: ObjectId('0000000000000000000000c3'), titol: '', descripcio: '', data_hora:ISODate(), grandaria: 10500, nom_arxiu: '', durada: '', thumbnail: 'c/users/formacio/documents/img/video3.png', reproduccions: 150000,
  likes: [],
  dislikes: [{date:ISODate(), _uid:ObjectId('0000000000000000000000b1')}],
  estat: ''},
]);

db.usuaris.insertMany([
  { _id: ObjectId('0000000000000000000000b1'), email: '', password: '', nom_usuari: '', data_naixement: ISODate("1995-01-01T00:00:00.000Z"), sexe: '', pais: '', codi_postal: '',
    videos_user: [
        {_id_video: ObjectId('0000000000000000000000c1'), id_canal: ObjectId('c00000000000000000000001')},
        {_id_video: ObjectId('0000000000000000000000c2'), id_canal: ObjectId('c00000000000000000000001')},
    ],
    playlists: [
      { _id: ObjectId('0000000000000000000000d1'), nom_playlist: '', data_creacio:ISODate(), estat: '',
      videos_playlist: [
            {_id_video: ObjectId('0000000000000000000000c3')}
        ],
      followers:[
            {_userId:ObjectId('0000000000000000000000b2')},
        ]
      },
    ],
    canal:{ canal_id:ObjectId('c00000000000000000000001'), nom_canal:"", descripcio:"", data_creacio:ISODate(),
        subscriptors:[
            { subs_id:ObjectId('0000000000000000000000b2')}
        ],
        videos_canal:[{id_video:ObjectId('0000000000000000000000c1')},{id_video:ObjectId('0000000000000000000000c2')}]  
      }
  },
  { _id: ObjectId('0000000000000000000000b2'), email: '', password: '', nom_usuari: '', data_naixement: ISODate("1984-12-22T22:10:00.000Z"), sexe: '', pais: '', codi_postal: '',
    videos_user: [
        {_id_video: ObjectId('0000000000000000000000c3')}
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
