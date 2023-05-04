console.log('Hello from NodeJS & Docker');
console.log('Environment is:', process.env.NODE_ENV || 'development');
console.log('Version is:', process.env.TAG_VERSION || 'unkown');
process.exit(0);

