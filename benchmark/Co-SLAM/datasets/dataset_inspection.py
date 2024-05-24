import cv2
import numpy as np
from PIL import Image
import os
from .robustness import (brightness, contrast, spatter, zoom_blur, motion_blur,
                         defocus_blur, gaussian_noise, shot_noise, impulse_noise,
                         speckle_noise, gaussian_blur, glass_blur, fog, frost,
                         snow, jpeg_compression, pixelate, gaussian_noise_strong)

class RobustInspection:
    def __init__(self):
        pass
    
    def process(self, color_path):
        color_data = cv2.imread(color_path)
        color_data_array = cv2.cvtColor(color_data, cv2.COLOR_BGR2RGB)
        
        color_data_image = Image.fromarray(color_data_array)

        perturbation_functions = {
            0: ("brightness perturbation", brightness),
            1: ("contrast perturbation", contrast),
            2: ("spatter perturbation", spatter),
            3: ("zoom_blur perturbation", zoom_blur),
            4: ("motion blur perturbation", motion_blur),
            5: ("defocus_blur", defocus_blur),
            6: ("gaussian_noise perturbation", gaussian_noise),
            7: ("shot_noise", shot_noise),
            8: ("impulse_noise", impulse_noise),
            9: ("speckle_noise", speckle_noise),
            10: ("gaussian_blur", gaussian_blur),
            11: ("glass_blur", glass_blur),
            12: ("fog", fog),
            13: ("frost", frost),
            14: ("snow", snow),
            15: ("jpeg_compression", jpeg_compression),
            16: ("pixelate", pixelate),
            17: ("no perturbation", None)
        }

        for perturb_type in range(18):  # Adjusted range to include the new perturbations
            for perturb_severity in [1, 3, 5]:
                if perturb_type in perturbation_functions:
                    perturbation_name, perturbation_function = perturbation_functions[perturb_type]
                    print(perturbation_name)
                    if perturbation_function:
                        perturbed_data = perturbation_function(color_data_image, perturb_severity)
                        print(type(perturbed_data))
                        perturbed_data = np.uint8(np.array(perturbed_data))
                        perturbed_data = cv2.cvtColor(perturbed_data, cv2.COLOR_RGB2BGR)
                        # Save the image
                        filename = f"perturbed_imgs/{perturbation_name}_severity_{perturb_severity}.png"
                        cv2.imwrite((filename), perturbed_data)
                        print(f"Saved to {filename}")

# Example usage
color_path = "./frame000199.jpg"
obj = RobustInspection()
obj.process(color_path)

