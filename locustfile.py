from locust import HttpUser, task, between


class LoadTesting(HttpUser):
    wait_time = between(1, 5)

    @task
    def root_employees(self):
        self.client.get("/api/employees", json={})

    @task(2)
    def not_exist_1(self):
        self.client.get("/api/employees/1", json={})

    @task(3)
    def not_exist_2(self):
        self.client.get("/api/employes", json={})
