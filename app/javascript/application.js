// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import '@hotwired/turbo-rails'
import 'controllers'
import initializeComments from './modules/comment';
import initializeLikes from './modules/like';
import initializeFollows from './modules/follow';

initializeComments();
initializeLikes();
initializeFollows();
