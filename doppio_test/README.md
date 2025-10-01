# Doppee Shop E2E Test (Robot Framework)

This repository contains end-to-end (E2E) UI automation tests for **Doppee Shop** using **Robot Framework** with **SeleniumLibrary**.  
It was implemented according to the given assignment requirements, with some additional improvements for test reliability and reusability.  

---

## 📌 Test Cases

### Test Case 1
1. Sign in  
2. Search for **mug**, wait for autocomplete, then click *Ceramic Mug*  
3. Select color and add **3 items** to cart  
4. Go to Checkout → tick all if required  
5. Verify total:  
   ```
   subtotal ± discount + shipping = total
   ```

### Test Case 2
1. Sign in  
2. Search for **Ceramic Mug** directly (no autocomplete required)  
3. Select color and add **3 items** to cart  
4. Go to Checkout → tick all if required  
5. Verify total:  
   ```
   subtotal ± discount + shipping = total
   ```

---

## ✅ Extra Improvement

After verifying the price calculation at checkout, the test **navigates back to the Cart page and removes the previously added product**.  

👉 This ensures the cart is cleared and the test suite can be run repeatedly without hitting the 10-product cart limit.

---

## ⚙️ Technical Highlights

- **Robot Framework** + **SeleniumLibrary**  
- **Page Object Model (POM)** structure:  
  - Locators and page keywords separated for reusability  
  - Keywords named in `PascalCase` (e.g., `Open app`, `Verify price calculation`)  
- **Assertions**: Clear formula for price validation  
- **Parallel execution supported**:  
  ```bash
  pabot --processes 2
  ```

---

## ▶️ How to Run

### 1. Navigate to the project folder:
```bash
cd doppio_test_exercise/doppio_test
```

### 2. Run with Robot (single process)

- Run a single test execution:
```bash
robot .\tests\checkout_mug.robot
```

- Run the same test 3 times consecutively (PowerShell example):
```powershell
for ($i=1; $i -le 3; $i++) {
    robot .\tests\checkout_mug.robot
}
```

### 3. Run with Pabot (parallel execution)

> ⚠️ Sometimes there may be issues depending on browser/driver stability when using `pabot`.  
> Use this if you want to run in parallel mode.

- Run once with 2 parallel processes:
```bash
pabot --processes 2 tests\checkout_mug.robot
```

- Run 3 consecutive times with 2 parallel processes (PowerShell example):
```powershell
for ($i=1; $i -le 3; $i++) {
    pabot --processes 2 tests\checkout_mug.robot
}
```

✅ Both Robot and Pabot commands should pass repeatedly without manual cleanup because of the **cart reset step**.

---

## 📊 Expected Outcome

- Both test cases pass 3 consecutive runs without manual intervention  
- Assertions correctly validate `subtotal ± discount + shipping = total`  
- Tests are stable, repeatable, and maintainable following POM structure  
