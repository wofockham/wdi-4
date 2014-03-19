Artist.destroy_all
Work.destroy_all

Artist.create(:name => 'Joan Miro', :nationality => 'Spanish', :dob => '1893/04/20', :period => '20th Century', :image => 'http://uploads0.wikipaintings.org/images/joan-miro(1).jpg!Portrait.jpg')
Work.create(:title => 'The Flight of the Dragonfly in Front of the Sun', :year => 1968, :medium => 'Oil on canvas', :style => 'Abstract', :image => 'http://uploads0.wikipaintings.org/images/joan-miro/the-flight-of-the-dragonfly-in-front-of-the-sun.jpg')
