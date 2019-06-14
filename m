Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail09.linbit.com (mail09.linbit.com [212.69.161.110])
	by mail.lfdr.de (Postfix) with ESMTPS id C85C3459CD
	for <lists+drbd-dev@lfdr.de>; Fri, 14 Jun 2019 12:02:04 +0200 (CEST)
Received: from mail09.linbit.com (localhost [127.0.0.1])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id DCD271028A72;
	Fri, 14 Jun 2019 12:02:02 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 339 seconds by postgrey-1.31 at mail09;
	Fri, 14 Jun 2019 12:02:01 CEST
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 3FD0B101AC67
	for <drbd-dev@lists.linbit.com>; Fri, 14 Jun 2019 12:02:01 +0200 (CEST)
Received: by mail-wr1-f49.google.com with SMTP id r16so1834705wrl.11
	for <drbd-dev@lists.linbit.com>; Fri, 14 Jun 2019 03:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=A/8WSxW/IQkc8gvxEf84/8rpDkMPDJGkrEIx9qUvf+8=;
	b=r7EO2RsFnhKzcKmLo/3enzKlz1nThYHMwJSoMXkH/MhzLKoJATlwHbfPMmFgNHXExB
	hPJstH15icrvmp8SXzyP+3NWgwPDW4BbWvkTZcp9yXZIGRIEdk+x52MljS/H+z4QEigq
	9sZGYTJVS9DmK0XYbbY5YVHB09mZj8+t5sR4M75fQxkxuf+96xCp7zevyBmXGds1UWIQ
	bJW+gt7Uak9iAkIOhVaNdtgowfW18GMrjURm/4Syh9+3NvJdogiTmfJYYuvPYzBGqVE5
	Ujccu3CP13NWHV0bDTAxn7rpq6xRZAQvQ9anjP8o7Dr5QcfT5Qw4bkLxF90sU/zXMLh8
	KwIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=A/8WSxW/IQkc8gvxEf84/8rpDkMPDJGkrEIx9qUvf+8=;
	b=NQQOtGJHe72h+lAnvzqZ6Yvj5xE39usE3u3jSSOe2jiaBvd4xHy0Dppw0smtY9kfKt
	7P4+CI8O3NCoTZojeUmM448xFGEFRTVrPldPUYsjhCC3smuJmdKQW3lvLXqSFBDWUJG7
	nlvCl2vsYB9CZCKOxeVoT6ujUiV+A1nY6tHE+HiNVPOL0mYEgI8Nz9n0LcdHAhWurwXG
	/ot1ZXEFYUDY9cs0KwHxKyGfcjRP4QEAQF1F4En8+IS2+UnWLbGV/uHI2kxwnoGgHkDI
	EWPFUOF1Gkid2/NIrDy6ZtoZsaKQQzRH3ebBQcqLA2xsdXmtlCvNkVzGzGVEgs1tocBQ
	n0eQ==
X-Gm-Message-State: APjAAAUTcSlW/m5f8MhNl8fuLe9+hPtuNbrlqN5j+wUrgz/ngCgz0DVo
	vPZjx583J9cBeGy0Dsjb86DfP0eGcicFgpwf
X-Google-Smtp-Source: APXvYqxGfNXUdsosxrrdw5rCCEoX9OMMmZ2kJy4Y7FAVpiz0/XqIylH2feTTD4z6eG6k9zD1YvpNLg==
X-Received: by 2002:adf:b68a:: with SMTP id j10mr12394419wre.88.1560506181658; 
	Fri, 14 Jun 2019 02:56:21 -0700 (PDT)
Received: from localhost (static.20.139.203.116.clients.your-server.de.
	[116.203.139.20])
	by smtp.gmail.com with ESMTPSA id f3sm2018599wre.93.2019.06.14.02.56.20
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 14 Jun 2019 02:56:20 -0700 (PDT)
Date: Fri, 14 Jun 2019 11:56:19 +0200
From: Roland Kammerer <roland.kammerer@linbit.com>
To: drbd-dev@lists.linbit.com
Message-ID: <20190614095619.fwnu54aralozc3xv@rck.sh>
References: <CAFsC7=cjKn2XKdOrQHsB8XMUnRQom7wd8yxHbp2s0afZLZRqkA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFsC7=cjKn2XKdOrQHsB8XMUnRQom7wd8yxHbp2s0afZLZRqkA@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Cc: =?utf-8?B?6I6K5Yex5YKR?= <kcchuang.white@gmail.com>
Subject: Re: [Drbd-dev] drbd local replication usage problem
X-BeenThere: drbd-dev@lists.linbit.com
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: "*Coordination* of development, patches,
	contributions -- *Questions* \(even to developers\) go to drbd-user,
	please." <drbd-dev.lists.linbit.com>
List-Unsubscribe: <http://lists.linbit.com/mailman/options/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=unsubscribe>
List-Archive: <http://lists.linbit.com/pipermail/drbd-dev>
List-Post: <mailto:drbd-dev@lists.linbit.com>
List-Help: <mailto:drbd-dev-request@lists.linbit.com?subject=help>
List-Subscribe: <http://lists.linbit.com/mailman/listinfo/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

T24gTW9uLCBKdW4gMTAsIDIwMTkgYXQgMDg6MjA6MjJQTSArMDgwMCwg6I6K5Yex5YKRIHdyb3Rl
Ogo+IEhpIGRyYmQtZGV2LAo+IAo+IEl0IHdpbGwgYmUgYXBwcmVjaWF0ZWQgaWYgeW91IGNhbiBn
aXZlIG1lIHNvbWUgYWR2aWNlLgo+IEknbSB0cnkgdG8gZG8gbG9jYWwgYmxvY2sgZGV2aWNlIHJl
cGxpY2F0aW9uKHZkYSB2ZGIpCgpHcmVhdC4gVGhhdCBhbHJlYWR5IGV4aXN0cywgaXQgaXMgY2Fs
bGVkIFJBSUQuIElmIHlvdSB0cnkgdG8gZG8gbG9jYWwKcmVwbGljYXRpb24gd2l0aCBEUkJELCB0
aGUgYW5zd2VyIGlzIHNvcnJ5LCBidXQgbm8sIHlvdSBhcmUgZG9pbmcgaXQKd3JvbmcuCgpJZiB5
b3UgaGF2ZSBhbnkgcXVlc3Rpb25zIGluIHRoZSBmdXR1cmUsIHBsZWFzZSBzZW5kIHRoZW0gdG8g
dGhlCmRyYmQtdXNlciBNTC4gZHJiZC1kZXYgaXMgZm9yIHBhdGNoIGNvb3JkaW5hdGlvbiBvbmx5
LgoKUmVnYXJkcywgcmNrCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyYmQtZGV2IG1haWxpbmcgbGlzdApkcmJkLWRldkBsaXN0cy5saW5iaXQuY29tCmh0
dHA6Ly9saXN0cy5saW5iaXQuY29tL21haWxtYW4vbGlzdGluZm8vZHJiZC1kZXYK
