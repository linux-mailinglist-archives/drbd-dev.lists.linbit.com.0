Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id A73F528BBD3
	for <lists+drbd-dev@lfdr.de>; Mon, 12 Oct 2020 17:27:51 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8DA9142038C;
	Mon, 12 Oct 2020 17:27:51 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
	[209.85.218.67])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 822D2420329
	for <drbd-dev@lists.linbit.com>; Mon, 12 Oct 2020 17:26:35 +0200 (CEST)
Received: by mail-ej1-f67.google.com with SMTP id ce10so23756765ejc.5
	for <drbd-dev@lists.linbit.com>; Mon, 12 Oct 2020 08:26:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:dkim-signature:date:from:to:cc:subject:message-id
	:organization:references:mime-version:content-disposition
	:content-transfer-encoding:in-reply-to:autocrypt;
	bh=u+7oPZd4ig1fhS9OARZ6iSD7j31KX9u8a8tGYkgGXeM=;
	b=NPdiUXF7+nwVHSlpwOEFRA6kxmo0pbdC2Ib93qry/qnH89ViWlkXuUvGZSmmoUALkp
	XQrFPaI7FuMybOVAQuqGAXtVMX7KaUUyQndYzxGiw8JoKflp2Ss+aFhvb6WENNIyVVl+
	mwodA3LmRbdupTpjsjBT5U5c5vyDWKIc/IfzsIr2dgYx8y6Li8mmwmxoLZCo2kQ6O3W6
	tAFcttpMp5Dw94CxeXfbl95f54tl1fq32qwKYm6rCa2zM+vmIOF0PqZ6HhtunDWQhwsR
	yALtsKfE1sMl6+sUbozknw5FqStRId2h78N60tFa5gO6QxamsuadyVZNCGZC3ilxjX4R
	IsVA==
X-Gm-Message-State: AOAM533OcEhuZvXsgyOIzk22JfTL4V6XIfQNIp0I+WQRYJvUwD4XXSSo
	LJGNSYSs9G7Q87zPeAZRTczG+v0GxpRAG8wh
X-Google-Smtp-Source: ABdhPJxCwJPo/BgkbbjVE7R/nBha4c6whBWL0sNugxlWw5XyJLfe49tdsNeuAYodFx2NjYdLZUIVKg==
X-Received: by 2002:a17:906:f90a:: with SMTP id
	lc10mr29467210ejb.272.1602516394763; 
	Mon, 12 Oct 2020 08:26:34 -0700 (PDT)
Received: from soda.linbit (62-99-137-214.static.upcbusiness.at.
	[62.99.137.214]) by smtp.gmail.com with ESMTPSA id
	d12sm10915180ejt.105.2020.10.12.08.26.34
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 12 Oct 2020 08:26:34 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Mon, 12 Oct 2020 17:26:32 +0200
Resent-Message-ID: <20201012152632.GI2116@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
Received: from mailout2.hostsharing.net (mailout2.hostsharing.net
	[83.223.78.233])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id F03804202E2
	for <drbd-dev@lists.linbit.com>; Mon, 12 Oct 2020 12:57:38 +0200 (CEST)
Received: from h06.hostsharing.net (h06.hostsharing.net [83.223.95.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "*.hostsharing.net",
	Issuer "COMODO RSA Domain Validation Secure Server CA" (not verified))
	by mailout2.hostsharing.net (Postfix) with ESMTPS id 63D0610189DF0;
	Mon, 12 Oct 2020 12:57:38 +0200 (CEST)
Received: from mail.home.lxtec.de
	(HSI-KBW-095-208-010-117.hsi5.kabel-badenwuerttemberg.de
	[95.208.10.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
	server-digest SHA256) (No client certificate requested)
	by h06.hostsharing.net (Postfix) with ESMTPSA id 41B4B6005F5A;
	Mon, 12 Oct 2020 12:57:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lxtec.de;
	s=mailxtec;
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:reply-to;
	bh=u+7oPZd4ig1fhS9OARZ6iSD7j31KX9u8a8tGYkgGXeM=;
	b=SYk776MH1pY45Zzx3jk9HSeR2x
	8mnaNryKRwgF0oMEK2Yu52heSaBT+31P7jF4ng0Pa1F+FAlasd4nbUe6HgKAP41sXqIn2Fyl91IsW
	Le2XTU92RgZNZyPU6RfdMbZQwgoZx0mv6qGPz1RlhSLI09GNRTFdiMC4W/jmzB33NLDST0maBEdhP
	cRKQmBzOaV2uDz/wu0721d3EZx9Zd7CTBv4O3jF/pRtwIjsC4jv8VYmbRtTd4rYoVXFx1QTMoNxti
	qdyH/GEJDHnTK6YWMBSPzS+DavCodf3k4hWmmaSsr9NaGfGXWGfQTXWM3B7Rh3M6tMUZMvpKxErzW
	2qmsTdhg==;
Received: from [127.0.0.1] (helo=localhost)
	by mail.home.lxtec.de with esmtp (Exim 4.94 2 (LXTEC))
	id 1kRvWL-0001e1-6y; Mon, 12 Oct 2020 12:57:37 +0200
X-Virus-Scanned: at mail.home.lxtec.de
Received: from mail.home.lxtec.de ([127.0.0.1])
	by localhost (mail.home.lxtec.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d-YOsXwu5BGV; Mon, 12 Oct 2020 12:57:37 +0200 (CEST)
Received: from riesebie by mail.home.lxtec.de with local (Exim 4.94 2 (LXTEC))
	id 1kRvWL-0001dw-2H; Mon, 12 Oct 2020 12:57:37 +0200
Date: Mon, 12 Oct 2020 12:57:37 +0200
From: Elimar Riesebieter <riesebie@lxtec.de>
To: Lukas Wunner <lukas@wunner.de>
Message-ID: <20201012105737.wnlrajearpdpqohu@toy.home.lxtec.de>
Organization: LXTEC
References: <1c700caab1ce71fa144116541471b3f7bb4629fa.1602432204.git.lukas@wunner.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1c700caab1ce71fa144116541471b3f7bb4629fa.1602432204.git.lukas@wunner.de>
Autocrypt: addr=riesebie@lxtec.de; prefer-encrypt=mutual; keydata=
	mDMEX1jtwhYJKwYBBAHaRw8BAQdAs61HjQAz35WpPCY10Cv+Yogn7p9Jj9h6RCCumDwgEXG0JkV
	saW1hciBSaWVzZWJpZXRlciA8cmllc2ViaWVAbHh0ZWMuZGU+iJAEExYIADgWIQRZA1EIeV8CRb
	fDhJMnMQo2HZmVNQUCX1jtwgIbAwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgAAKCRAnMQo2HZmVN
	WcPAP9wwap25jg2f1mS3353l3suaXcBsfX0XNGdCSfICVzUOAEA9GBRqB3/rOgLBLhZKnpJ1GFI
	ENN3OQ54tk+fzNVe3ga4OARfWO3CEgorBgEEAZdVAQUBAQdA6qcxjNtSY3LupzR/w0kMPsiljNb
	VvDBVhlb1gWPsoXgDAQgHiHgEGBYIACAWIQRZA1EIeV8CRbfDhJMnMQo2HZmVNQUCX1jtwgIbDA
	AKCRAnMQo2HZmVNSlSAP9Ip88aSckUV3dQrBgYEQdqBQ9No4/4LZLLBVJH2mDPTAEA6stoZOHJk
	ZZOPGu9KvBC1ZzUkKJTBHKR/+M9R1sBhgw=
Cc: Michael Hierweck <michael.hierweck@hostsharing.net>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Philipp Reisner <philipp.reisner@linbit.com>, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH drbd-9.0] compat: __vmalloc() pgprot argument
 was removed in v5.8
X-BeenThere: drbd-dev@lists.linbit.com
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: "*Coordination* of development, patches,
	contributions -- *Questions* \(even to developers\) go to drbd-user,
	please." <drbd-dev.lists.linbit.com>
List-Unsubscribe: <https://lists.linbit.com/mailman/options/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=unsubscribe>
List-Archive: <http://lists.linbit.com/pipermail/drbd-dev>
List-Post: <mailto:drbd-dev@lists.linbit.com>
List-Help: <mailto:drbd-dev-request@lists.linbit.com?subject=help>
List-Subscribe: <https://lists.linbit.com/mailman/listinfo/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

* Lukas Wunner <lukas@wunner.de> [2020-10-11 18:07 +0200]:
[...]
> --- a/drbd/drbd_bitmap.c
> +++ b/drbd/drbd_bitmap.c
> @@ -366,9 +366,7 @@ static struct page **bm_realloc_pages(struct drbd_bitmap *b, unsigned long want)
          ^ should be 8 otherwise this patch doesn't apply.
>  	new_pages = kzalloc(bytes, GFP_NOIO | __GFP_NOWARN);
>  	if (!new_pages) {
>  		new_pages = __vmalloc(bytes,
> -				GFP_NOIO | __GFP_HIGHMEM | __GFP_ZERO,
> -				PAGE_KERNEL);
> +				      GFP_NOIO | __GFP_HIGHMEM | __GFP_ZERO);
>  		if (!new_pages)
>  			return NULL;
>  	}
> -- 
> 2.27.0
> 

-- 
  Alles, was viel bedacht wird, wird bedenklich!;-)
         Friedrich Nietzsche

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
