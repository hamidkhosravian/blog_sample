describe Api::V1::ArticlesController, :type => :routing do
  describe 'articles' do
    it 'index' do
      expect(get: 'api/v1/articles').to route_to(controller: 'api/v1/articles', action: 'index')
    end

    it 'show' do
      expect(get: 'api/v1/articles/1').to route_to(controller: 'api/v1/articles', action: 'show', id: "1")
    end

    it 'create' do
      expect(post: 'api/v1/articles').to route_to(controller: 'api/v1/articles', action: 'create')
    end

    it 'update' do
      expect(put: 'api/v1/articles/1').to route_to(controller: 'api/v1/articles', action: 'update', id: "1")
    end

    it 'destroy' do
      expect(delete: 'api/v1/articles/1').to route_to(controller: 'api/v1/articles', action: 'destroy', id: "1")
    end
  end
end
