function fn() {
    var env = karate.env || 'qa'; // get system property 'karate.env'
    karate.log('karate.env system property was:', env);
    
    const config = {};

    var baseUrl = 'https://reqres.in';
    var baseUrlTodoLy = 'https://todo.ly'

    if (env === 'dev') {
        baseUrl = 'https://reqres.in';
        baseUrlTodoLy = 'https://todo.ly';
    }
    if (env === 'qa') {
        baseUrl = 'https://reqres.in';
        baseUrlTodoLy = 'https://todo.ly';  
    }
    
    config.baseUrl = baseUrl;
    config.baseUrlTodoLy = baseUrlTodoLy;

    return config;
    
}