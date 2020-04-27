function result = saveModelFiles(file)
%saveModelFiles  Project custom task to save changed Simulink files
%
% Input arguments:
%  file - string - The absolute path to a file included in the custom task.
%  When you run the custom task, project provides the file 
%  input for each selected file.
%
% Output arguments:
%  result - string - If the file was dirty, the result indicates that the 
%  file was saved. The project displays the result in the Custom 
%  Task Results column.

% Copyright 2012-2018 The MathWorks, Inc.


[~, name, ext] = fileparts(file);
if ismember(ext, {'.mdl','.slx'})
    if bdIsLoaded(name) && bdIsDirty(name)
        try
            save_system(file);
            result = 'Saved file';
        catch exception
            warning(exception.message);
            result = 'Failed to save file';
        end
    else
        result = 'No save required';
    end
else
    result = [];
end

end
