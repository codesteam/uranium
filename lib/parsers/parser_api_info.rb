class ParserApiInfo
  attr_reader :version, :title, :description

  def initialize(document)
    raise 'Document info section not specified'     if document['info'].nil?
    raise 'Document info.version not specified'     if document['info']['version'].nil?
    raise 'Document info.title not specified'       if document['info']['title'].nil?
    raise 'Document info.description not specified' if document['info']['description'].nil?

    @version     = document['info']['version']
    @title       = document['info']['title']
    @description = document['info']['description']
  end
end