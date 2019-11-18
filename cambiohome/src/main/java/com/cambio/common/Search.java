package com.cambio.common;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;

@Data
@RequiredArgsConstructor
@AllArgsConstructor
public class Search extends Pagination{

	private String searchType;
	private String keyword;
	
}
