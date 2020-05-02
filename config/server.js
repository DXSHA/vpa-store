// config used by store server side only
module.exports = {
	// store UI language
	language: process.env.LANGUAGE || 'ru',
	// used by Store (server side)
	ajaxBaseUrl: 'http://83.166.241.132:3001/ajax',
	// used by Store (server side)
	apiBaseUrl: 'http://83.166.241.132:3001/api/v1',

	storeListenPort: 3000,

	// key to sign tokens
	jwtSecretKey: process.env.JWT_SECRET_KEY || '-',

	// ключ для подписи  cookies
	cookieSecretKey: process.env.COOKIE_SECRET_KEY || '-'
};
