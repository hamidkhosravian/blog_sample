describe Api::V1::CommentsController, :type => :routing do
  describe 'comments' do
    it 'index' do
      expect(get: 'api/v1/articles/1/comments').to route_to(controller: 'api/v1/comments', action: 'index', article_id: "1")
    end

    it 'show' do
      expect(get: 'api/v1/articles/1/comments/1').to route_to(controller: 'api/v1/comments', action: 'show', id: "1", article_id: "1")
    end

    it 'create' do
      expect(post: 'api/v1/articles/1/comments').to route_to(controller: 'api/v1/comments', action: 'create', article_id: "1")
    end

    it 'update' do
      expect(put: 'api/v1/articles/1/comments/1').to route_to(controller: 'api/v1/comments', action: 'update', id: "1", article_id: "1")
    end

    it 'destroy' do
      expect(delete: 'api/v1/articles/1/comments/1').to route_to(controller: 'api/v1/comments', action: 'destroy', id: "1", article_id: "1")
    end
  end
end
