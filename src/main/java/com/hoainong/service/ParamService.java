package com.hoainong.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpServletRequest;

@Service
public class ParamService {
	@Autowired
	HttpServletRequest request;

	public String getString(String name, String defaultParam) {
		String value = request.getParameter(name);
		if (value != null) {
			return value;
		} else {
			return defaultParam;
		}
	}

	public int getInt(String name, int defaultParam) {
		String value = request.getParameter(name);
		if (value != null) {
			return Integer.parseInt(value);
		} else {
			return defaultParam;
		}
	}

	public double getDouble(String name, double defaultParam) {
		String value = request.getParameter(name);
		if (value != null) {
			return Double.parseDouble(value);
		} else {
			return defaultParam;
		}
	}

	public boolean getBoolean(String name, Boolean defaultParam) {
		String value = request.getParameter(name);
		if (value != null) {
			return Boolean.parseBoolean(value);
		} else {
			return defaultParam;
		}
	}
	
	public Date getDate(String name, String pattern) throws ParseException {
		String value = request.getParameter(name);
		SimpleDateFormat format = new SimpleDateFormat(pattern);
		Date date = format.parse(value);
		if(value != null) {
			return date;
		}else {
			return null;
		}
	}
	
	public Path save(MultipartFile file, String path) throws IOException {
		if (!file.isEmpty()) {
			String fileName = StringUtils.cleanPath(file.getOriginalFilename());
			Path filePath = Path.of(path, fileName);
			Files.copy(file.getInputStream(), filePath,
					StandardCopyOption.REPLACE_EXISTING);
			return filePath;
		}
		return null;
	}
}
