def get_rer(weight, unit="kg"):
    """
    Pets’ energy (Calorie) needs to maintain a healthy weight for their life
    stage depends upon several factors. First, the energy to perform essential
    body functions like digestion, respiration, heart functions, brain
    functions, etc.

    Resting Energy Requirements (RER), which can be calculated by multiplying
    the animal’s body weight in kilograms raised to the ¾ power by 70, for
    example, a 10kg (22lb) adult neutered dog of healthy weight needs

        RER = 70(10kg)3/4 ≈ 400 Calories/day.

    One also can use the charts below to estimate resting calorie needs.

    Args:
        weight (float): weight
        unit (str): unit of weight
    Returns:
        rer (float): calories per day

    """
    assert unit.lower() in ["lbs", "kg"]

    if unit.lower() == "lbs":
        weight /= 2.20462  # in kg
    rer = 70 * weight ** 0.75
    print("{:.2f} {} cat needs {:.2f} cal per day.".format(weight, unit, rer))
    return rer


def get_dry_food_weight(current_calories=370.0, target_calories=270.0,
                        wet_food_per_can=76.0, can_num=0.75):
    """
    Get feeding guideline based on target weight.

    Args:
        current_calories (float): the calories intake per day now.
        target_calories (float)
        wet_food_per_can (float)
        can_num (float)

    Returns:
        dry_weight (float): weight in gram of dry food
    """
    g_per_cup = 127  # g
    en_den = 436 / g_per_cup  # KCal/g
    dry_weight = (current_calories - wet_food_per_can * can_num) / en_den
    dry_cup = dry_weight / g_per_cup

    info = "{:.1f} Kcal in total\n" \
           "{:.2f} can wet food\n{:.1f} g, " \
           "or {:.2f} cup dry food".format(
        current_calories, can_num, dry_weight, dry_cup)

    progress = (current_calories - target_calories) / target_calories * 100
    info = info + "\n\n{:.2f} % intake over your goal.".format(progress)

    print("--------------")
    print(info)
    print("--------------")

    return dry_weight


if __name__ == "__main__":
    # Standard calories needed, I set the goal to 7.3 kg for now
    rer = get_rer(7.0)

    get_dry_food_weight(current_calories=350, target_calories=rer,
                        wet_food_per_can=58, can_num=0)
