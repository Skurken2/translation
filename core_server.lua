local translations = { }
addEventHandler('onResourceStart', resourceRoot, function()
  local xml = xmlLoadFile('translations.xml')
  for index, node in pairs(xmlNodeGetChildren(xml)) do
    local _continue_0 = false
    repeat
      local name = xmlNodeGetAttribute(node, 'name')
      if not (name) then
        _continue_0 = true
        break
      end
      translations[name] = { }
      for index, string in pairs(xmlNodeGetChildren(node)) do
        local _continue_1 = false
        repeat
          local id = xmlNodeGetAttribute(string, 'id')
          local text = xmlNodeGetAttribute(string, 'text')
          if not (id and text) then
            _continue_1 = true
            break
          end
          translations[name][id] = text
          _continue_1 = true
        until true
        if not _continue_1 then
          break
        end
      end
      _continue_0 = true
    until true
    if not _continue_0 then
      break
    end
  end
  return xmlUnloadFile(xml)
end)
getTranslationTable = function(lang)
  if not (lang) then
    return translations
  end
  return translations[lang]
end
