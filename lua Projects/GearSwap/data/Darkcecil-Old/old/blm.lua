function get_sets()

end
------------------------------------------------------------------------------------------------
function precast(Spell)
    if Spell.name=="Stone" then
       cast_delay(2)     
    end
end
------------------------------------------------------------------------------------------------
function aftercast(Spell)
    add_to_chat(158,Spell.name)
    if Spell.name=="Stone" then
            
                send_command('input /ma stone <t>;')  
    end
end  
