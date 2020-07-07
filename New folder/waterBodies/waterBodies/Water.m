function varargout = Water(varargin)
% WATER MATLAB code for Water.fig
%      WATER, by itself, creates a new WATER or raises the existing
%      singleton*.
%
%      H = WATER returns the handle to a new WATER or the handle to
%      the existing singleton*.
%
%      WATER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in WATER.M with the given input arguments.
%
%      WATER('Property','Value',...) creates a new WATER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Water_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Water_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Water

% Last Modified by GUIDE v2.5 03-Apr-2018 10:19:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Water_OpeningFcn, ...
                   'gui_OutputFcn',  @Water_OutputFcn, ...
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


% --- Executes just before Water is made visible.
function Water_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Water (see VARARGIN)

% Choose default command line output for Water
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Water wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Water_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function River_Callback(hObject, eventdata, handles)
% hObject    handle to River (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of River as text
%        str2double(get(hObject,'String')) returns contents of River as a double


% --- Executes during object creation, after setting all properties.
function River_CreateFcn(hObject, eventdata, handles)
% hObject    handle to River (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Water.
function Water_Callback(hObject, eventdata, handles)
% hObject    handle to Water (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
lake_name=get(handles.River,'String');
img1Path=strcat('C:\Users\GMRAO\Desktop\waterBodies\',lake_name,'22k16.png');
img2Path=strcat('C:\Users\GMRAO\Desktop\waterBodies\',lake_name,'22k9.png');
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

ans1=imfuse(a,a1);
ans2=imfuse(res,res1);
% axes(handles.axes1);
% subplot(2,3,1),imshow(a1);title('2009');
% subplot(2,3,2),imshow(a);title('2017');
% subplot(2,3,3),imshow(ans1);title(area);
% subplot(2,3,4),imshow(res1);title(strcat('old area  ',num2str(old),' units'));
% subplot(2,3,5),imshow(res);title(strcat('new area  ',num2str(new),' units'));
% subplot(2,3,6),imshow(ans2);title(area);


axes(handles.lake_name);
imshow(ans2);
%a1=imread('C:\Users\GMRAO\Desktop\waterBodies\image22k9.png');
