// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import "bootstrap"
import "../stylesheets/application"

document.addEventListener('DOMContentLoaded', function(event) {
    document.getElementById('brand_select').addEventListener('change', (event) => {
        const value = event.target.value
        const model_select = document.getElementById('model_select');
        const search_input = document.getElementById('search');

        if(value.length !== 0) {
            fetch(`/brands/${value}/models`).then((response) => {
                const resp = response.json().then((resp) => {
                    model_select.innerHTML = '';
                    model_select.appendChild(document.createElement('option'));
                    for(const item of resp) {
                        console.log(item);
                        const opt = document.createElement('option');
                        opt.value = item.id;
                        opt.innerHTML = item.name;
                        model_select.appendChild(opt);
                    }
                });
            });
        }
    });
});


Rails.start()
Turbolinks.start()
ActiveStorage.start()
