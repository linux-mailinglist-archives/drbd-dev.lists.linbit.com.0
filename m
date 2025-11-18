Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DC7C68E91
	for <lists+drbd-dev@lfdr.de>; Tue, 18 Nov 2025 11:50:26 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8CE8D162789;
	Tue, 18 Nov 2025 11:50:13 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
	[209.85.208.43])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 68B6C1608F4
	for <drbd-dev@lists.linbit.com>; Tue, 18 Nov 2025 11:50:10 +0100 (CET)
Received: by mail-ed1-f43.google.com with SMTP id
	4fb4d7f45d1cf-6431b0a1948so9418779a12.3
	for <drbd-dev@lists.linbit.com>; Tue, 18 Nov 2025 02:50:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1763463009;
	x=1764067809; darn=lists.linbit.com; 
	h=content-transfer-encoding:in-reply-to:content-language:from
	:references:cc:to:subject:user-agent:mime-version:date:message-id
	:from:to:cc:subject:date:message-id:reply-to;
	bh=KiC+7yTG4lV+2V65MF1U8z4j9rCHROwUgeMm0bXv8L0=;
	b=RuB/x5DpMrpBK7d+wNhsBa8VYOPuhMoB+cfEodVrCYs+KuJDep9OWXqf5dhaFYC04a
	ilJJ49Fthl4DC5ABf3Tk3ho2Pzi6jyk4qv8q7CjqxXY2AnntHw/xbHwp3Mq52idctRkS
	2+SlbzQIaUncTFZ/hxvYRP0ScEungDIeLzihloggKrnyNrUgFy2qyp8qax7Z80x8jLPe
	hyVV1RX8+FjHW5Y/PLlhiTdxOy1ssoIwZ6NTLC56KiTF4jhw6mtUUwpAk7t5p/oD7zCO
	QaJz38TokqKi5QLSJh1WlfHHZb+cAdS0bCnYYOOgmH5Om4SZeOM8pOwllDCW4yhtF83e
	tw3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1763463009; x=1764067809;
	h=content-transfer-encoding:in-reply-to:content-language:from
	:references:cc:to:subject:user-agent:mime-version:date:message-id
	:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
	:reply-to;
	bh=KiC+7yTG4lV+2V65MF1U8z4j9rCHROwUgeMm0bXv8L0=;
	b=Gh3jU1mucNxon0rFaaHMzNBN8R/qFnVTqHAiKGL6GkzxK7FLh6vzY1p1wa1/Pec84W
	7q0h7DbVyNAhORQaTFE+JFH0eyStcI8leSzEJKlvTNbtlx7iyAy2UStEXjCTXAawiiwG
	yA4W5eDpC2Mt57HN7rmJXIubbJ5LnzIY/gDkqM0frwVU+Wcq1E5pkiFP8LgwrNXnhP9s
	YGACvXE/t/2YiHOD4p75Yyz+9qaNk2rU6kFVml7kwvVJci6ND8vapd6qmYRgH70LYpa7
	r/UTfugXaGA6DXlUiIFBpYxq4MGXM4r85DPr1hS/b94GtiU+C+NE7RkoL1b3bxvIrZ6H
	ZAlA==
X-Gm-Message-State: AOJu0Yyx2h6p+kvwR3LdvmJELJ69WP2Dvl6TbZvFsDsvSKUcXQ6dDd0P
	FjSQMz/0YRla9naYOjkBf4itbl5ecdoB5jhAarZB4I5DwzN0Ff4KfHxbLIzWymbQhMYmLw==
X-Gm-Gg: ASbGnctkPPRWSOLPgRfEejD0QoY6eGR3v4IrnzLV6mjT2wTjy+q0zlPpOo7s5G2+FgA
	eQDrcEne9GbZAMjZo4pl8cMTovXHAkdQiHiUgwgbjAXGDzcU5iosaCwHhEaaNXtLWqIBfj2FKvq
	010Hgp9j7Xb+xlSjD8nN6kIqxgC5axTcJJddG5yYw6PsDJf71+RfOqAcZ/Ng75vGFxWLDiJBWGV
	vx7cnofj3sdnUCkIkBjCYDTvgVzLyoYameVnm+05KctL7I9tfwPgypUQJWxrXh0OIjKcCnZsskw
	Vy2tl/tJb0IVfWwaluT5WYZY5fO+55783pq9szf+pfHeKOPKxEhQzna9rW8m/35JwV6KngBdG4y
	WuO/pfsGt3T73hfa0pBYhrvxgUqx7GLGczxKFyu7ZJwbFaLmmzGjLnC0dWsUTR/b9xIPKonp/7z
	nqNody2RltHrAO9Kp/E0Vgw5NC/kwWfbgZZWZkYINUcT1CpXcxgOLgLAQHVahqHugO
X-Google-Smtp-Source: AGHT+IHDiUP7NwR4m7iptduYHwN4ZXEfuuPS+NXRZTh9Gs4mYWbGWK6pPsRgbu0R8p6JdF/bHSz0uw==
X-Received: by 2002:a05:6402:3049:10b0:641:62bb:9c0 with SMTP id
	4fb4d7f45d1cf-64350ebe40cmr11298204a12.33.1763463009519; 
	Tue, 18 Nov 2025 02:50:09 -0800 (PST)
Received: from [192.168.178.55] (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	4fb4d7f45d1cf-6433a3d8775sm12390493a12.5.2025.11.18.02.50.08
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 18 Nov 2025 02:50:08 -0800 (PST)
Message-ID: <a7d484bf-4812-4367-8fca-575a56529c67@linbit.com>
Date: Tue, 18 Nov 2025 11:50:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] compat: make block_device_operations tests grsec
	compatible
To: Mathias Krause <minipli@grsecurity.net>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>
References: <20251110125924.511384-1-minipli@grsecurity.net>
From: =?UTF-8?Q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
Content-Language: en-US
In-Reply-To: <20251110125924.511384-1-minipli@grsecurity.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: drbd-dev@lists.linbit.com
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
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

Am 10.11.25 um 13:59 schrieb Mathias Krause:
> The grsecurity patch enforces that instances of certain types are always
> constified, with the help of a compiler plugin. One of these types is
> 'struct block_device_operations'. Code that tries to modify a such-typed
> object will cause compiler errors, leading to wrong results for the
> kernel compatibility tests.
> 
> Change these tests to do direct type compare tests instead of trying to
> modify the object, making them compatible with grsecurity kernels.
> 
> Signed-off-by: Mathias Krause <minipli@grsecurity.net>

Thanks, applied: https://github.com/LINBIT/drbd/commit/376a2932bf8f44dd0a18bc70f3309f3e71e0d37d

-- 
Christoph Böhmwalder
LINBIT | Keeping the Digital World Running
DRBD HA —  Disaster Recovery — Software defined Storage

