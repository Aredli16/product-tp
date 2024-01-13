<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: COCOL
  Date: 13/01/2024
  Time: 12:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Product</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com?plugins=forms"></script>
</head>
<body>
<div class="bg-white px-6 py-24 sm:py-32 lg:px-8">
    <div class="mx-auto max-w-2xl text-center">
        <h2 class="text-4xl font-bold tracking-tight text-gray-900 sm:text-6xl">TP - J2EE - Product</h2>
        <p class="mt-6 text-lg leading-8 text-gray-600">This is a simple CRUD application for managing products.</p>
    </div>
</div>
<form action="<c:url value="/add-product"/>" method="post" class="max-w-2xl mx-auto px-4 sm:px-6 lg:px-8">
    <div class="space-y-12">
        <div class="border-b border-gray-900/10 pb-12">
            <h2 class="text-base font-semibold leading-7 text-gray-900">Create a product</h2>
            <p class="mt-1 text-sm leading-6 text-gray-600">Get started by filling in the information below to create
                your new product.</p>

            <div class="mt-10 grid grid-cols-1 gap-x-6 gap-y-8 sm:grid-cols-6">
                <div class="sm:col-span-3">
                    <label for="name" class="block text-sm font-medium leading-6 text-gray-900">Name</label>
                    <div class="mt-2">
                        <input type="text" name="name" id="name"
                               class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
                               required>
                    </div>
                </div>

                <div class="col-span-full">
                    <label for="description"
                           class="block text-sm font-medium leading-6 text-gray-900">Description</label>
                    <div class="mt-2">
                        <textarea id="description" name="description" rows="3"
                                  class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
                                  required></textarea>
                    </div>
                </div>

                <div class="sm:col-span-4">
                    <label for="price" class="block text-sm font-medium leading-6 text-gray-900">Price</label>
                    <div class="relative mt-2 rounded-md shadow-sm">
                        <div class="pointer-events-none absolute inset-y-0 left-0 flex items-center pl-3">
                            <span class="text-gray-500 sm:text-sm">€</span>
                        </div>
                        <input type="number" name="price" id="price" step="0.01"
                               class="block w-full rounded-md border-0 py-1.5 pl-7 pr-12 text-gray-900 ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
                               placeholder="0.00" aria-describedby="price-currency" required>
                        <div class="pointer-events-none absolute inset-y-0 right-0 flex items-center pr-3">
                            <span class="text-gray-500 sm:text-sm" id="price-currency">EUR</span>
                        </div>
                    </div>
                </div>

                <div class="sm:col-span-4">
                    <label for="type" class="block text-sm font-medium leading-6 text-gray-900">Type</label>
                    <select id="type" name="type"
                            class="mt-2 block w-full rounded-md border-0 py-1.5 pl-3 pr-10 text-gray-900 ring-1 ring-inset ring-gray-300 focus:ring-2 focus:ring-indigo-600 sm:text-sm sm:leading-6"
                            required>
                        <option value="HIGH_TECH">High Tech</option>
                        <option value="FOOD">Food</option>
                        <option value="CLOTHES">Clothes</option>
                    </select>
                </div>
            </div>
        </div>
    </div>

    <div class="mt-6 flex items-center justify-end gap-x-6">
        <a href="<c:url value="/"/>" type="button" class="text-sm font-semibold leading-6 text-gray-900">Cancel</a>
        <button type="submit"
                class="rounded-md bg-indigo-600 px-3 py-2 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">
            Save
        </button>
    </div>
</form>
</body>
</html>
