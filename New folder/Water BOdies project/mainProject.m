function varargout = mainProject(varargin)
% MAINPROJECT MATLAB code for mainProject.fig
%      MAINPROJECT, by itself, creates a new MAINPROJECT or raises the existing
%      singleton*.
%
%      H = MAINPROJECT returns the handle to a new MAINPROJECT or the handle to
%      the existing singleton*.
%
%      MAINPROJECT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAINPROJECT.M with the given input arguments.
%
%      MAINPROJECT('Property','Value',...) creates a new MAINPROJECT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before mainProject_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to mainProject_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help mainProject

% Last Modified by GUIDE v2.5 03-Apr-2018 11:33:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @mainProject_OpeningFcn, ...
                   'gui_OutputFcn',  @mainProject_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before mainProject is made visible.
function mainProject_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to mainProject (see VARARGIN)

% Choose default command line output for mainProject
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes mainProject wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = mainProject_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function lake_name_Callback(hObject, eventdata, handles)
% hObject    handle to lake_name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of lake_name as text
%        str2double(get(hObject,'String')) returns contents of lake_name as a double


% --- Executes during object creation, after setting all properties.
function lake_name_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lake_name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Find.
function Find_Callback(hObject, eventdata, handles)
lake_name=get(handles.lake_name,'String');
img1Path=strcat('C:\Users\GMRAO\Desktop\waterBodies\',lake_name,'\2016.png');
img2Path=strcat('C:\Users\GMRAO\Desktop\waterBodies\',lake_name,'\2009.png');
a=imread(img1Path);
a1=imread(img2Path);

red=a(:,:,1);green=a(:,:,2);blue=a(:,:,3);
red1=a1(:,:,1);green1=a1(:,:,2);blue1=a1(:,:,3);

b=rgb2gray(a);
b1=rgb2gray(a1);
%d=impixel(a1);

res=((red+green)<=blue);
res1=red1<blue1+15 & green1<blue1+15;
new=0;
for i=1:size(res,1)
    for j=1:size(res,2)
        if(res(i,j)==1)
            new=new+1;
        end
    end
end
old=0;
for i=1:size(res1,1)
    for j=1:size(res1,2)
        if(res1(i,j)==1)
            old=old+1;
        end
    end
end

area=((old-new)/old)*100;

set(handles.text3,'String',strcat('Diminished Area % = ',num2str(area)));
areaValue=(old*8-new*8)*1000;
set(handles.text7,'String',strcat('Diminished Area(in square kms) =',num2str(areaValue)));

ans1=imfuse(a,a1);
ans2=imfuse(res,res1);

axes(handles.axes3);
imshow(a);
%title('2009');
axes(handles.axes4);
imshow(res);
%title('2017');
axes(handles.axes5);
imshow(a1);
%title(area);
axes(handles.axes6);
imshow(res1);
%title(strcat('old area  ',num2str(old),' units'));
% axes(handles.axes1);
% imshow(res);
%title(strcat('new area  ',num2str(new),' units'));
% axes(handles.axes1);
% imshow(ans2);
%title(area);



axes(handles.final);
imshow(ans2);
%a1=imread('C:\Users\GMRAO\Desktop\waterBodies\image22k9.png');

% hObject    handle to Find (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
