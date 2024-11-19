require 'acceptance_helper'

resource 'Posts' do
  # Posso metterli anche a livello di example.
  header('Accept', 'application/vnd.api+json')
  header('Content-Type', 'application/vnd.api+json')

  explanation('The collection of posts.')

  get '/api/v1/posts' do
    example 'All posts' do
      do_request
      expect(status).to eq 200
      expect(response_body).to include('Homer Simpson')
    end
  end

  # Viene chiamata con /api/v1/posts/1 perché ho definito id = 1 nel let.
  get '/api/v1/posts/:id' do
    parameter(:id, 'Post ID', required: true)

    # Il context serve solo per dividere meglio le cose ma poi non viene mostrato nella pagina.
    context 'When id is valid' do
      let(:id) { 1 }

      example 'Should get a post' do
        do_request

        expect(status).to eq 200
        expect(response_body).to include('Homer Simpson')
      end
    end

    context 'When id is not valid' do
      let(:id) { -1 }

      example 'Should get a error' do
        do_request

        expect(status).to eq 400
      end
    end
  end

end