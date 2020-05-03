// config used by store client side only
module.exports = {
	// store UI language
	language: process.env.LANGUAGE || 'ru',
	// used by Store (server side)
	ajaxBaseUrl: process.env.AJAX_BASE_URL || 'http://83.166.241.132:3001/ajax'
};
