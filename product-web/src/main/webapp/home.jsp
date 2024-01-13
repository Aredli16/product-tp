<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Product</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
<div class="bg-white px-6 py-24 sm:py-32 lg:px-8">
    <div class="mx-auto max-w-2xl text-center">
        <h2 class="text-4xl font-bold tracking-tight text-gray-900 sm:text-6xl">TP - J2EE - Product</h2>
        <p class="mt-6 text-lg leading-8 text-gray-600">This is a simple CRUD application for managing products.</p>
    </div>
</div>

<div class="px-4 sm:px-6 lg:px-8">
    <div class="sm:flex sm:items-center">
        <div class="sm:flex-auto">
            <h1 class="text-base font-semibold leading-6 text-gray-900">Product</h1>
            <p class="mt-2 text-sm text-gray-700">Manage product</p>
        </div>
        <div class="mt-4 sm:ml-16 sm:mt-0 sm:flex-none">
            <a href="<c:url value="/add-product"/>" type="button"
               class="block rounded-md bg-indigo-600 px-3 py-2 text-center text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">
                Add product
            </a>
        </div>
    </div>
    <div class="mt-8 flow-root">
        <div class="-mx-4 -my-2 overflow-x-auto sm:-mx-6 lg:-mx-8">
            <div class="inline-block min-w-full py-2 align-middle sm:px-6 lg:px-8">
                <div class="overflow-hidden shadow ring-1 ring-black ring-opacity-5 sm:rounded-lg">
                    <table class="min-w-full divide-y divide-gray-300">
                        <thead class="bg-gray-50">
                        <tr>
                            <th scope="col"
                                class="py-3.5 pl-4 pr-3 text-left text-sm font-semibold text-gray-900 sm:pl-6">ID
                            </th>
                            <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900">Name</th>
                            <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900">
                                Description
                            </th>
                            <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900">Price</th>
                            <th scope="col" class="relative py-3.5 pl-3 pr-4 sm:pr-6">
                                <span class="sr-only">Edit</span>
                            </th>
                        </tr>
                        </thead>
                        <tbody class="divide-y divide-gray-200 bg-white">
                        <jsp:useBean id="products" scope="request"
                                     type="java.util.List<fr.tp.producttp.entity.Product>"/>
                        <c:forEach items="${products}" var="product">
                            <tr>
                                <td class="whitespace-nowrap px-3 py-4 text-sm text-gray-500">${product.id}</td>
                                <td class="whitespace-nowrap px-3 py-4 text-sm text-gray-500">${product.name}
                                </td>
                                <td class="whitespace-nowrap px-3 py-4 text-sm text-gray-500">${product.description}</td>
                                <td class="whitespace-nowrap px-3 py-4 text-sm text-gray-500">${product.price} €</td>
                                <td class="relative flex justify-end items-center whitespace-nowrap py-4 pl-3 pr-4 text-right text-sm font-medium sm:pr-6">
                                    <a href="<c:url value="/edit-product?id=${product.id}"/>" class=" text-indigo-600
                                       hover:text-indigo-900 pr-3">Edit<span class="sr-only">,${product.name}</span></a>
                                    <form action="<c:url value="/delete-product?id=${product.id}"/>" method="post">
                                        <input type="hidden" name="id" value="${product.id}">
                                        <button type="submit" class="text-red-600 hover:text-red-900">Delete</button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>

                        <!-- More people... -->
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
