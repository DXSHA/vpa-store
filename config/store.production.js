// config used by store client side only
module.exports = {
	// store UI language
	language: process.env.LANGUAGE || 'ru',

	// used by Store (server side)
	apiBaseUrl: 'http://83.166.241.132:3001/api/v1',

	// used by Store (server side)
	ajaxBaseUrl: 'http://83.166.241.132:3001/ajax',

	storeListenPort: 3000,

	// key to sign tokens
	jwtSecretKey: process.env.JWT_SECRET_KEY || '-',

	// key to sign store cookies
	cookieSecretKey: process.env.COOKIE_SECRET_KEY || '-'
};
