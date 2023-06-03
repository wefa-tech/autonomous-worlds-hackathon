import requests
from io import BytesIO
import base64
from PIL import Image
import json

plants_dic = {
}
quality_dic = {
    'low':"dying, death, sad",
    'medium':"",
    'high':"lush, lively, excited, happy",
}
element_dic = {
    "fire":{
        "prompt":"flames fire red",
        "negativePrompt":'yellow'
    },
    "water":{
        "prompt":"water ocean aqua blue",
        "negativePrompt":'white'
    },
    "earth":{
        "prompt":"ground dirty earth brown",
        "negativePrompt":'red yellow'
    },
    "air":{
        "prompt":"sky clouds air",
        "negativePrompt":'blue'
    }
}
creatures_dic = {
    'butterfly':
    {
        'template':'butterfly.jpg',
        'id':0
    },
    'firefly':
    {
        'template':'firefly.png',
        'id':1
    },
    'dragonfly':
    {
        'template':'dragonfly.png',
        'id':2
    }, 
    'worm':
    {
        'template':'worm.png',
        'id':3
    },
    'ant':
    {
        'template':'ant.jpg',
        'id':4
    }
}

#stable diffusion
# this is subject to change so maybe use kwargs
async def generate_creature_route(plant_info, creature_type, element_type, description, cached = True):

    this_creature = creatures_dic[creature_type]
    this_element = element_dic[element_type]

    if cached == False:

        url = 'http://127.0.0.1:7860/controlnet/txt2img' # This is the line to update with GPU provider
        with open(this_creature['template'] , "rb") as image_file:
            control_img = base64.b64encode(image_file.read())

        dics = {
            # 512 by 512 is cheaper but not sd2
            #This is probably the most editable line (needs some work)
            # Some of these prompts are going to cause copyright issues if not filtered
            'prompt': description + ' ' + this_element['prompt'] + ' pokemon, digimon',
            'negative_prompt': 'plant '+this_element['negativePrompt'],
            "seed": -1,
            "subseed": -1,
            "subseed_strength": 0,
            "batch_size": 1,
            "n_iter": 1,
            "steps": 20,
            "cfg_scale": 7,
            "width": 512,
            "height": 512,
            "restore_faces": True,
            "eta": 0,
            "sampler_index": "Euler a",
            "controlnet_input_image": [control_img],
            "controlnet_module": 'seg_ofcoco',
            "controlnet_model": 'control_sd15_seg [fef5e48e]',
            "controlnet_weight": 2,
            "controlnet_guidance": 1.0,
        }
        #the json above should be captured somewhere
        x = requests.post(url, json = dics)
        img1 = json.loads(x.text)['images'][0]
        #saving image
        # im = Image.open(BytesIO(base64.b64decode(img1)))
        # im.save(args.outdir + file.stem + ".png", 'PNG')

        return img1