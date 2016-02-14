/**
 * Created by Joe on 15/4/20.
 */

var timer = null
var editor_url = ''

function set_progress(val, msg) {
  progress_bar = document.getElementById('progress_bar')
  progress_bar.setAttribute("aria-valuenow", val)
  progress_bar.setAttribute("style", "min-width: 2em; width: " + val + "%;")
  progress_bar.innerHTML = msg
};

function add_iframe(val, url) {
  nav_tab = document.getElementById('nav_tab')
  nav_tab.innerHTML = nav_tab.innerHTML + '<li role="presentation"><a href="#pane_'+val+'" onclick="record(\'frame_'+val+'\')" aria-controls="pane_'+val+'" role="tab" data-toggle="tab">'+val+'</a></li>'
  pane = document.getElementById('panes')
  pane.innerHTML = pane.innerHTML + '<div role="tabpanel" class="tab-pane active" id="pane_'+val+'"><div class="embed-responsive embed-responsive-16by9"><iframe class="embed-responsive-item" id="frame_'+val+'" src="'+url+'"></iframe></div></div>'
};

function get_progress(id) {
    $.ajax({
        url: '/dispatches/' + id + '/progress',
        type: 'get',
        success: function(data) {
            if (data['progress'] == -1) {
              set_progress('100', 'Failure')
              document.getElementById('progress_bar').className = "progress-bar progress-bar-danger"
              clearInterval(timer)
            }
            else if (data['progress'] == 0) {
            }
            else if (data['progress'] == 1) {
              set_progress('30', 'Preparing Environment')
            }
            else if (data['progress'] == 2) {
              set_progress('60', 'Preparing Proxies')
            }
            else if (data['progress'] == 3) {
              set_progress('100', 'Success')
              document.getElementById('progress_bar').className = "progress-bar progress-bar-success"

              document.getElementById('frame_shell').src = data['url']
              document.getElementById('frame_editor').src = data['editor_url']
              for (var key in data['url_list']) {
                if (key != 'shell' && key != 'editor') {
                  add_iframe(key, data['url_list'][key])
                }
              }

              //document.getElementById('iframe').src = data['url']
              //editor_url = data['editor_url']
              clearInterval(timer);
            }
            else {
                document.getElementById('stage_1').className = 'bg-warning'
                document.getElementById('stage_2').className = 'bg-warning'
                document.getElementById('stage_3').className = 'bg-warning'
                document.getElementById('failure_info').style.display = "block"
                clearInterval(timer)
            }
        }
    })
};

function btn_open_editor() {
  window.open(editor_url)
};

function btn_open_notebook() {
  window.open(notebook_url)
};
