translations = {}

addEventHandler 'onResourceStart', resourceRoot, ->
	xml = xmlLoadFile 'translations.xml'
	for index, node in pairs(xmlNodeGetChildren xml)
		name = xmlNodeGetAttribute node, 'name'
		unless name continue
		translations[name] = {}
		for index, string in pairs(xmlNodeGetChildren node)
			id = xmlNodeGetAttribute string, 'id'
			text = xmlNodeGetAttribute string, 'text'
			unless id and text continue
			translations[name][id] = text
	xmlUnloadFile xml

export getTranslationTable = (lang) ->
	unless lang return translations
	return translations[lang]