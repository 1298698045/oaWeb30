﻿layui.define("form",
function(exports) { 
    var MOD_NAME = "multiSelect",
     o = layui.jquery,
     form = layui.form,
     selected_vals = [],
     multiSelect = function() {};   multiSelect.prototype.init = function() { 
        var ts = this;  o('select[multiple]').each(function(idx, item) { 
            var t = o(this)
            var selds = [];  t.find('option:selected').each(function() {  selds.push(o(this).val()); 
            })  
            t.next().addClass('multi').find('.layui-select-title').click(function() {  
                selected_vals[idx] && o(this).find('input').val(selected_vals[idx].join(',')); 
                }).next().find('dd').each(function() { 
                    var dt = o(this),
                     checked = (dt.hasClass('layui-this') || o.inArray(dt.attr('lay-value'), selds) > - 1) ? 'checked': '',
                     title = dt.text(),
                     disabled = dt.attr('lay-value') === '' ? 'disabled': '';  dt.html('<input type="checkbox" lay-skin="primary" title="' + title + '" ' + checked + ' ' + disabled + '>');  ts.selected(idx, t, dt); 
                    }).click(function(e) { 
                        var dt = o(this);       
                        if(e.target.localName == 'dd'&&dt.attr('lay-value') !== '') {              
                            var status = dt.find('.layui-form-checkbox').toggleClass('layui-form-checked').hasClass('layui-form-checked');              
                            dt.find('input').prop('checked', status);         
                        }          
                        dt.parents('.layui-form-select').addClass('layui-form-selected');       
                        ts.selected(idx, t, dt);
                    });
        })
        form.render('checkbox'); 
     }   
     multiSelect.prototype.selected = function(idx, t, dt) {    
         selected_vals[idx] = [];   
         t.find('option').prop('selected', false);    
         dt.parents('dl').find('[type=checkbox]:checked').each(function() {        
             var val = o(this).parent().attr('lay-value');        
             t.find('option[value=' + val + ']').prop('selected', true);    
             selected_vals[idx].push(o(this).attr('title'));  
         })     
         dt.parents('dl').prev().find('input').val(selected_vals[idx].join(','));
     }
     multiSelect.prototype.render = function (type, filter) {
         form.render(type, filter);
         this.init();
     }
     var i = new multiSelect();
     i.init();
     exports(MOD_NAME, i);
})
                