Rails.application.routes.draw do
  mount OneOff::Engine => "/one_off"
end
