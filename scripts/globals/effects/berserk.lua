-----------------------------------
--
-- dsp.effect.BERSERK
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target,effect)
    local mLvl = target:getMainLvl();
    local mJob = target:getMainJob();
    local bAtk = 25;

    if(mJob == dsp.job.WAR and mLvl >= 90) then
        bAtk = 35;
    elseif (mJob == dsp.job.WAR and mLvl >= 80) then
        bAtk = 33;
    elseif (mJob == dsp.job.WAR and mLvl >= 70) then
        bAtk = 31;
    elseif (mJob == dsp.job.WAR and mLvl >= 60) then
        bAtk = 29;
    elseif (mJob == dsp.job.WAR and mLvl >= 50) then
        bAtk = 27;
    end
    target:addMod(dsp.mod.ATTP, bAtk)
    target:addMod(dsp.mod.RATTP, 25)
    target:addMod(dsp.mod.DEFP,-25)
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    local mLvl = target:getMainLvl();
    local mJob = target:getMainJob();
    local bAtk = 25;

    if(mJob == dsp.job.WAR and mLvl >= 90) then
        bAtk = 35;
    elseif (mJob == dsp.job.WAR and mLvl >= 80) then
        bAtk = 33;
    elseif (mJob == dsp.job.WAR and mLvl >= 70) then
        bAtk = 31;
    elseif (mJob == dsp.job.WAR and mLvl >= 60) then
        bAtk = 29;
    elseif (mJob == dsp.job.WAR and mLvl >= 50) then
        bAtk = 27;
    end
    target:delMod(dsp.mod.ATTP,bAtk)
    target:delMod(dsp.mod.DEFP,-25)
    target:delMod(dsp.mod.RATTP, 25)
end