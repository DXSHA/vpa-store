import VamshopClient from 'vamshop-client';
import clientSettings from './settings';

const api = new VamshopClient({
	ajaxBaseUrl: clientSettings.ajaxBaseUrl || '/ajax'
});

export default api;
