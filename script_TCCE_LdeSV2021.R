library("EBImage")

# pre-processamento
ima = readImage("imagem_teste.jpg") # lendo uma imagem
ima = rotate(ima, 90) # rotacionando a imagem para o formato landscape
ima = resize(ima, 800) # reduzindo a definição para 800x425
colorMode(ima) = Grayscale # alterando a cor para escala de cinza
img = ima - 0.3 #diminuindo brilho
img = img * 2.2 #aumentando o contraste

# processamento
y1 = floodFill(img, c(228.7546, 222.0941), col = 0, tol = 0.5)# preenchimento 
#da área da etiqueta apartir da coordenada central e parametro de tolerancia 0,5
res1 = bwlabel(y1)#Binarização da área de etiqueta
res1 = res1[1:800,1:450,1] #Transformando o 3D array em 2D array
ft1 = computeFeatures.shape(res1)# Calculando a área da etiqueta


y2 = floodFill(img, c(545.1494, 222.548), col = 0, tol = 0.3)# preenchimento 
#da área da colonia apartir da coordenada central e parametro de tolerancia 0,3
res2 = bwlabel(y2)#Binarização da área de colonia
res2 = res2[1:800,1:450,1]#Transformando o 3D array em 2D array
ft2 = computeFeatures.shape(res2)# Calculando a área da colonia

#Extraindo a área de cada região de interesse
area1 = ft1[1,1]
area2 = ft2[1,1]

#Conversão da unidade de área da região da colônia
area_colonia = (area2*1600)/area1
print(paste("Área: ", area_colonia))
