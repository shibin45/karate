function fn() {
var env = karate.env; // get system property 'karate.env'
if(!env){
    env = 'https://reqres.in'; // a custom 'intelligent' default
  }

var config = {
   baseUrl: 'https://reqres.in',
   token: 'reqres_b458ddd2a8ad4de0a74aac263a642947'
};

if (env == 'dev') {
    // over-ride only those that need to be
    config.baseUrl = 'https://reqres.in';
}

return config;
}