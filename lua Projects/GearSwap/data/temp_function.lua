function job_post_midcast(spell, action, spellMap, eventArgs)
	if spell.action_type == 'Magic' then
		if spell.en == 'Cursna' then
			equip(check_player_for_doom(spell.target.name))
		end
	end
end

party_buffs = {}

function party_buff_change(party_member,name,gain,buff)
	if name == 'Doom' and gain then
		party_buffs[party_member.name] = name
	elseif name == 'Doom' and gain == false then
		if table.containskey(party_buffs, party_member.name) then
			party_buffs[party_member.name] = nil
		end
	end
end

function check_player_for_doom(target)
	if table.containskey(party_buffs, target) then
		return sets.midcast.Doom
	else
		return sets.midcast.Cursna
	end
end